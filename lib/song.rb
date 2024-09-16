class Song
  attr_reader :artist, :genre
  attr_accessor :name

  @@all = []
  
  def initialize(*data)
    @name   = data[0]
    @artist = data[1]; artist.songs << self if data[1]
    @genre  = data[2]; genre.songs  << self if data[2]
  end
  
  class << self
    def all
      @@all
    end
    
    def destroy_all
      @@all.clear
    end
    
    def create(*data)
      song_name, artist, genre = data

      instance = self.new(song_name, artist, genre)
      instance.save
      
      instance
    end
    
    def new_from_filename(file)
      artist_name, song_name, genre_name = data_from_filename(file)
      
      artist = find_artist(artist_name)
      genre = find_genre(genre_name)

      artist ||= Artist.new(artist_name)
      genre ||= Genre.new(genre_name)
      
      Song.new(song_name, artist, genre)
    end
    
    def create_from_filename(file)
      artist_name, song_name, genre_name = data_from_filename(file)
      
      artist = find_artist(artist_name)
      genre = find_genre(genre_name)
      
      Song.create(song_name, artist, genre)
    end
    
    def data_from_filename(filename)
      filename.chomp('.mp3').split(' - ')
    end
    
    def find_by_name(name)
      all.find { |song| song.name == name }    
    end
    
    def find_or_create_by_name(name)
      song = find_by_name(name)
      song ||= create(name)
      
      song
    end
    
    def find_artist(artist_name)
      Artist.all.find { |artist| artist.name == artist_name }
    end
    
    def find_genre(genre_name)
      Genre.all.find { |genre| genre.name == genre_name }
    end
  end
  

  
  def save
    self.class.all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end
  
end