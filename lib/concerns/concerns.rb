module Concerns
  module Findable
    def find_by_name(words)
      all.find { |song| song.name == words }
    end

    def find_or_create_by_name(words)
      self.find_by_name(words) ? self.find_by_name(words) : self.create(words)
    end
  end
end
