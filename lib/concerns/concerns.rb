module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end

    def find_or_create_by_name(name)
      find = self.find_by_name(name)
      if find == nil
        self.create(name)
      else
        return find
      end
    end

    def create(name)
      song = self.new(name)
      song.save
      song
    end

  end
end
