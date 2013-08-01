require "yaml"
require "liquid"

module Dragon
  class Options

    attr_accessor :environment, :release, :local_settings

    def initialize( root_given )
      @root = root_given
      @release = Time.now.utc.strftime("%Y%m%d%H%M%S")
      @local_settings = nil
    end

    def self.parse( root, args )
      depfile_loc = File.expand_path(File.join( root, "Depfile" ))
      raise Dragon::Exceptions::DragfileMissing, "Depfile must exists in current directory, please run `depify .`." unless File.exists?( depfile_loc )
      output = self.new( root )
      output.environment  = args[0]
      output.release  = args[1] if args.size > 1
      output.local_settings = YAML.load_file( depfile_loc )[output.environment]
      output.update_commands
      output
    end

    def release= str
      @release = "#{ Time.now.utc.strftime("%Y%m%d%H%M%S") }_#{ str }"
    end

    def release_dir
      File.join( @local_settings['destination_root'], "releases", @release )
    end

    def shared_dir
      File.join( @local_settings['destination_root'], "shared" )
    end

    def update_commands
      return nil unless !@local_settings.nil? && @local_settings.has_key?( "commands" )
      @local_settings['commands'].each{|k,v|
        rendered_value = Liquid::Template.parse( v ).render( command_liquid_args )
        @local_settings['commands'][k] = rendered_value
      }
    end

  private

    def command_liquid_args
      {
        "release_dir" => release_dir,
        "shared_dir"  => shared_dir
      }.merge( @local_settings )
    end

  end
end