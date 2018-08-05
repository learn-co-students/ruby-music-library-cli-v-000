module Concerns

  module Findable

    def find_by_name(name)
      self.all.detect do |song|
        if song.name == name
          return song
        end
      end
    end

    def find_or_create_by_name(name)
      find_by_name(name) || self.create(name)
    end

  end
end
