class Song  
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save    
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(file_path)
    name_arr = file_path.split(/\s-\s/)
    artist = Artist.find_or_create_by_name(name_arr[0])
    genre = Genre.find_or_create_by_name(name_arr[2].chomp(".mp3"))       
    self.new(name_arr[1], artist, genre)
  end

  def self.create_from_filename(file_path)
    name_arr = file_path.split(/\s-\s/)
    artist = Artist.find_or_create_by_name(name_arr[0])
    genre = Genre.find_or_create_by_name(name_arr[2].chomp(".mp3"))       
    self.create(name_arr[1], artist, genre)
  end

  def self.create(song_name, artist=nil, genre=nil)
    song = Song.new(song_name, artist, genre)
    song.tap {|x| x.save}   
  end

  def save
    Song.all << self
  end 

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include? self
  end

end