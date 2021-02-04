module Concerns::Findable

    def find_by_name(name)
        self.all.each do |song|
            if song.name == name
                return song
            end
        end
        nil
    end

    def find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end
end