class Song
 # Take all of the methods in the Findable module and then add them to clas methods
 extend Concerns::Findable
  attr_accessor :name, :artist, :song , :genre

  @@all =[]

  def initialize(name, artist= nil, genre = nil)

    @name = name
    self.artist = artist if artist
    self.genre  = genre if genre
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

  # def self.create(name, artist = nil, genre = nil)
  #   self.new(name, artist, genre).tap {|x| x.save}
  # end
  def self.create(name, artist=nil, genre=nil)
    self.new(name, artist, genre).tap {|object| object.save}
  end

  def artist=(artist_name)
   @artist = artist_name
   @artist.add_song(self)
  end

  def genre=(genre)
   @genre = genre
   genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(name)
     arr = name.split(" - ")
     artist_name = arr[0]
     song_name = arr[1]
     genre_name = arr[2].gsub('.mp3', '')
     #binding.pry
     artist = Artist.find_or_create_by_name(artist_name)
     genre = Genre.find_or_create_by_name(genre_name)
     self.create(song_name, artist, genre)

    end

    #binding.pry
    def self.create_from_filename(name)
       arr = name.split(" - ")
       artist_name = arr[0]
       song_name = arr[1]
       genre_name = arr[2].gsub('.mp3','')
       #binding.pry
       artist = Artist.find_or_create_by_name(artist_name)
       genre = Genre.find_or_create_by_name(genre_name)
       self.create(song_name, artist, genre)
    end


end
