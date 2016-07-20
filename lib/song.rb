class Song
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre = genre if genre
    self.artist = artist if artist
  end

  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_genre(self)
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end

  def self.sort_all_alphabet
    @@all.sort do |x, y|
      if x.artist.name == y.artist.name
        y.artist.name<=>x.artist.name
      else
        y.name<=>x.name
      end
     end
  end

end

#def self.sort_all_alphabet
#    @@all.sort do |x, y|# uses the sort command http://ruby-doc.org/core-1.9.3/Array.html#method-i-sort
#      if x.artist.name == y.artist.name # if the artist.name is equal to the other artist name
#        y.artist.name<=>x.artist.name #sorts by artist name, for instance if y has the array element of 1 and x has 0, then y will get -1 to index and x will get +1 which is what happens with <=> operators, also known as the spaceship operator.
#      else
#        y.name<=>x.name # sorts by name
#      end
#     end
#  end
