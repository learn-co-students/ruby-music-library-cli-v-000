class Genre

attr_accessor :name,:songs,:artists

extend Concerns::Findable

@@all = []

def initialize(name)
@name = name
@songs = []
end

def add_song(song)
song.genre = self
@songs << self unless songs.include?(song)
end


def self.all
@@all
end

def save

@@all << self

end

def self.destroy_all
	self.all.clear
end

def self.create(genre)
 self.new(genre).tap {|g| g.save}

end

def artists

self.songs.collect {|a| a.artist}.uniq
end

 def to_s
    self.name
end
end
