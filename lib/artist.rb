class Artist

attr_accessor :name, :songs

extend Concerns::Findable

@@all = []

def initialize(name)
@name = name
@songs = []
end

def add_song(song)
song.artist = self unless song.artist == self
@songs << song unless @songs.include?(song)
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

def self.create(artist)
 self.new(artist).tap {|a| a.save}

end

def genres
	self.songs.collect {|song| song.genre}.uniq
end

def to_s
    self.name
  end

end
