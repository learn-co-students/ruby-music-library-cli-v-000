class Song
   extend Concerns::Findable

@@all = []
attr_accessor :name, :artist, :genre

def initialize(name, artist=nil, genre=nil)
@@song << self
  # @name = name
  # self.artist = artist if artist
  # self.genre = genre if genre
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

  def self.create(name)
    song = self.new(name)
    song.save
    song

  end

  def artist=(artist)
    @artist = artist

artist.add_song(self)
end

def genre=(genre)
@genre = genre
genre.add_song(self)

end

# def self.find_by_name(name)
#   @@all.find do |song|
#     song.name == name
#   end
#
# end
# def self.create_by_name(name)
# song = self.create(name)
#
# end
#
# def self.find_or_create_by_name(name)
#
#
#   if song = self.find_by_name(name)
#      song
#     else
#     self.create_by_name(name)
#
#
#   end
#   end
  def self.new_from_filename(filename)

    title = filename.split(' - ')
    artist = title[0]
    song = title[1]
    genre = title[2].split('.').first
    new_song = self.create(song)

    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song

end
end
