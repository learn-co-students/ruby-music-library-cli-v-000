module Concerns::Findable
    def find_by_name(name)
      all.each{|song| return song if song.name == name}
    end

    def self.find_or_create_by_name(name)
      if find_by_name(name) != nil
        find_by_name(name)
      else
        self.create(name)
      end

    end
end
