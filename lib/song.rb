class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    @genre = genre
    self.genre = genre if genre
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

#learn spec/001_song_basics_spec.rb

def self.find_by_name(name)
  @@all.detect {|a| a.name == name}
end

def self.find_or_create_by_name(name)
  if find_by_name(name)
    song = find_by_name(name)
  else
    song = create(name)
  end
  song
end



  def self.new_from_filename(filename)
    filename_chomp = filename.chomp(".mp3")
    filename_parse = filename_chomp.split(" - ")
    artist_name = filename_parse[0]
    song_name = filename_parse[1]
    genre_name = filename_parse[2]
    artist_create = Artist.find_or_create_by_name(artist_name)
    genre_create = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist_name, genre_name)
  end

=begin
  def self.create_from_filename(filename)
    song = self.new
    filename_chomp = filename.chomp(".mp3")
    filename_parse = filename_chomp.split(" - ")
    song.artist_name = filename_parse[0]
    song.name = filename_parse[1]
    @@all << song
  end
=end

end
