class Genre
extend Concerns::Findable

attr_accessor :name
attr_reader :songs #returns the genre's 'songs' collectio

@@all = [ ]


def initialize(name)
	@name = name
	@songs = []

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
	g = Genre.new(name)
	g.save
	g
end

def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre ||= self
end

def artists
   songs.map(&:artist).uniq
   end



end
