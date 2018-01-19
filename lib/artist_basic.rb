class Artist
extend Concerns::Findable


attr_accessor :name
attr_reader :songs


@@all = [ ]

def initialize(name)
	@name = name
	@songs = [ ]
end

def self.all
	@@all
end

def self.destroy_all
	@@all = [ ]
end

def save
	@@all << self
end

def self.create(name)
	a = Artist.new(name)
	a.save
	a
end

def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist ||= self
end

def genres
   songs.map(&:genre).uniq
end




end
