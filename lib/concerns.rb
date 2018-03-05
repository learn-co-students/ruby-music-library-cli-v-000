
module Concerns::Findable

    def self.find_by_name(name_of_song)
        self.all.find do |s|
          s.name == name_of_song
        end
    end

end
