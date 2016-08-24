module Concerns
  module Findable

    def find_by_name(title)
      self.all.detect {|song| song.name == title}
    end

    def find_or_create_by_name(title)
      if self.find_by_name(title) == nil
        song = self.create(title)
      else
        self.find_by_name(title)
      end

    end

  end
end