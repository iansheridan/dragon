module Dragon
   class Deploy

      def initialize(options)
         @options = options
         @boxes = Dragon::ServerSet.new @options
         @comrun = Dragon::CommandRunner.new @boxes.set
      end

      def default_commands sequence
         return {} if @options.local_settings.has_key?( "commands_run_default" )
         {
            use_git: [{
               git: "clone --depth=1 --branch=#{ @options.local_settings["git_branch"] } #{ @options.local_settings["git_url"] } #{ @options.release_dir }",
            }],
            local_upload: [{
               dir_upload: "#{ @options.local_settings["local_upload_dir"] }",
            }],
            current_linking: [{
               ln: "-nfs #{ @options.release_dir } #{ @options.local_settings["destination_symlink"] }",
            }]
         }[sequence]
      end

      def run

         # before
         unless @options.local_settings.has_key?( "local_upload_dir" )
            @comrun.run default_commands( :use_git )
         else
            @comrun.run default_commands( :local_upload )
         end

         # user commands
         @comrun.run @options.local_settings["commands"] if @options.local_settings.has_key?( "commands" )

         # after
         @comrun.run default_commands( :current_linking )

      end

   end
end