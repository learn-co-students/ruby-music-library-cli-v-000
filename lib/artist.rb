class Artist
#   extend Concerns::Findable


attr_accessor :name
@@all = []

    def initialize(name)
        @name = name
        #@@all << self
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def destroy_all
        @@all = []
    end

    def self.create
        self.new
        self.save
    end
end
