module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect { |songs| songs.name == name }
    end

    def find_or_create_by_name(name)
      find_name = self.find_by_name(name)

      find_name ? find_name : self.create(name)
    end
  end
end
