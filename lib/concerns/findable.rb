module Concerns::Findable

    def find_by_name(name)
      self.all.detect{|o| o.name}
    end

    def find_or_create_by_name(name)
      if find_by_name(name) == nil
        Song.new(name)
      else
        find_by_name(name)
      end
    end
end
