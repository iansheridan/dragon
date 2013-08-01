module Dragon
   class CommandRunner

      def initialize( boxes )
         @boxes = boxes
      end

      def run commands
         commands.each{|k,v|
            puts "runnning: #{ k } #{ v }"
            unless v.empty?
               ran = @boxes.send( k.to_sym, v )
            else
               ran = @boxes.send( k.to_sym )
            end
            puts "     output: #{ ran.stdout }" if ran.respond_to? :stdout
         }
      rescue Rye::Err => e
         puts e.message
      end

   end
end