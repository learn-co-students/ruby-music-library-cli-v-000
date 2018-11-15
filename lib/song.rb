class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self) 
  end
  
  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
      genre.songs << self
    end
  end
  
  def self.all 
    @@all.uniq
  end 

  def self.destroy_all 
    @@all.clear 
  end 
  
  def save 
    @@all << self
  end 
  
  def self.create(song)
    self.new(song).tap {|song| song.save}
  end
  
  def self.find_by_name(name) 
    all.find{ |song| song.name == name }
  end 
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(file)
    new_file = file.split(" - ")
      artist = new_file[0]
      name = new_file[1]
      genre = new_file[2].gsub(".mp3","")
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre)
    new_song = Song.new(name, new_artist, new_genre)
  end 

  def self.create_from_filename(file)
    @@all << new_from_filename(file)
  end 
end 


  # def self.new_from_filename(filename)
  #   parts = filename.split(" - ")
  #   artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

  #   artist = Artist.find_or_create_by_name(artist_name)
  #   genre = Genre.find_or_create_by_name(genre_name)

  #   new(song_name, artist, genre)
  # end
  
  # def self.create_from_filename(filename)
  #   new_from_filename(filename).tap{ |s| s.save }
  # end