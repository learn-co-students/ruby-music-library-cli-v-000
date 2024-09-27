module Concerns

  module Findable

      def find_by_name(string)
        self.all.each do |object|
          if object.name == string
            return object
          else
          end

        end
        return nil
      end

      def find_or_create_by_name(string)
        if self.find_by_name(string) == nil
            new_object = self.create(string)
        else
          self.find_by_name(string)
        end



      end

  end



end
