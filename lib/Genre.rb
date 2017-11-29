class Genre
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    def self.create(name)
        instance = self.new(name)
        instance.save
        instance
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end
end