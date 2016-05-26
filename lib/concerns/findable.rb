module Concerns
    module Findable  
        
        def find_by_name(enter_name)
          self.all.detect {|song| song.name == enter_name}
        end

        def find_or_create_by_name(enter_name)
          if self.find_by_name(enter_name) == nil
            self.create(enter_name)
          else
            self.find_by_name(enter_name)
          end
        end

    end
end