require "rye"

module Dragon
   class ServerSet

      attr_reader :set

      def initialize(options)
         @options = options
         @set = server_set
      end

      def server_set
        set = Rye::Set.new
        @options.local_settings['servers'].each{ |s|
          set.add_boxes server( s )
        }
        set
      end

      def server str
         Rye::Box.new( str, { keys: [ @options.local_settings['servers_key_location'] ], user: @options.local_settings['servers_username'] } )
      end

   end
end