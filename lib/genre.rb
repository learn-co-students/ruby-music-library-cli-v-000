class Genre
attr_accessor :name
attr_reader :songs
@@all = []
extend Concerns::Findable

def initialize(name)
@name = name
@songs = []
end

def self.all
@@all
end
def self.destroy_all
all.clear
end

def save
@@all << self
end

def name=(name)
@name = name
end

def artists
self.songs.collect{|song| song.artist}.uniq
end

def self.create(name)
genre = new(name)
genre.save
genre
end

end
