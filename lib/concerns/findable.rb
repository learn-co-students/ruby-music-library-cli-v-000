module Concerns::Findable

    def find_by_name(name)
      self.all.detect {|song| song.name == name}
    end

    def find_or_create_by_name(name)
      if find_by_name(name).nil?
        create(name)
      else
        find_by_name(name)
      end
    end

    def sorted
      self.all.sort_by {|object| object.name }
    end

end
