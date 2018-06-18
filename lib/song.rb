class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all=[]
  
  
  def initialize(name, artist=nil, genre=nil)
    @name=name
    if artist !=nil
      self.artist=(artist)
    end
    if genre !=nil
      self.genre=(genre)
    end
  end
  
  def name
    @name
  end
  
  def name=(name)
    @name=name
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
    song=self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name==name}
  end
  
  def self.find_or_create_by_name(name)
      unless self.find_by_name(name) == nil
        self.find_by_name(name)
      else
        self.create(name)
      end
  end
  
  def self.new_from_filename(filename)
    artist_name, song_name, genre_name= filename.split(" - ")
    genre_name.gsub!(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
  
end