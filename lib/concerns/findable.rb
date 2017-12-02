module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect {|song| song.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end

  end

end
