class Genre

  attr_accessor :name
  @@all = []

    def initialize(name)
      @name = name
    end

    def self.all
      @@all
    end

    def save
      @@all << self
      self
    end

    def self.create(name)
      self.new(name).save
    end

    def self.destroy_all
      @@all.clear
    end

end
