require "rye"

module Dragon
   class ServerSet

      attr_reader :set

      def initialize(options)
         add_commands # making sure added commads are set befor server set is created
         @options = options
         @set = server_set
      end

   private

      def server_set
        set = Rye::Set.new
        @options.local_settings['servers'].each{ |s|
          set.add_boxes server( s )
        }
        set
      end

      def server str
         Rye::Box.new( str, { keys: [ @options.local_settings['servers_key_location'] ], user: @options.local_settings['servers_username'], safe: false } )
      end

      # custom commands
      def add_commands
        Rye::Cmd.add_command :rm
      end

   end
end