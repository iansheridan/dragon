module Dragon
   class CommandRunner

      def initialize( boxes )
         @boxes = boxes
      end

      def run commands
         commands.each{|c,i|
            name = c.keys[0]
            args = c[name]
            puts "runnning: #{ name } #{ args }"
            unless args.empty?
               ran = @boxes.send( name.to_sym, args )
            else
               ran = @boxes.send( name.to_sym )
            end
            puts "     output: #{ ran.stdout }" if ran.respond_to? :stdout
         }
      rescue Rye::Err => e
         puts e.message
      end

   end
end