module Concerns

  module Findable

    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end

    def create(name)
      song = new(name)
      song.save
      song
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
  end

end
