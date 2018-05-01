class Song
  
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
      artist.songs << self
    end
    if genre != nil
      self.genre = genre
    end
    save
  end
  
  def self.create(song)
    song = self.new(song)
    song
  end 

  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.new_from_filename(file_name)
    song_name = file_name.split( ' - ' )[1]
    artist_name = file_name.split( ' - ' )[0]
    genre_name = file_name.split(' - ')[2].split('.mp3')[0]
    @artist = Artist.find_or_create_by_name(artist_name)
    @name = song_name
    @genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(@name, @artist, @genre)
    @artist.add_song(song)
    @artist.save
    song
  end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end
    
    

end