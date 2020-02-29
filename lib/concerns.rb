module Concerns
  module Findable

    def self.find_by_name(name)
      @@all.detect{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end

    def self.create(name)
      new = self.new(name)
      @@all << self
    end

  end
end
