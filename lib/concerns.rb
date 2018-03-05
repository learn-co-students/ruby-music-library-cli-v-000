
module Concerns
    module Findable
        def find_by_name(name_of_song)
            self.all.find do |s|
              s.name == name_of_song
            end
        end

        def find_or_create_by_name(name)
             self.find_by_name(name) || self.create(name)
        end
    end
end
