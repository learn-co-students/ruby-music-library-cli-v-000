class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self) unless artist == nil
    genre.add_song(self) unless genre == nil
    #devo invocare anche qui #add_song perchè qualora venisse inizializzata una nuova canzone
    #con artista e genere già assegnati, devo dare gli strumenti ad initialize per smistare subito la nuova canzone negli array giusti.
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  #def self.find_by_name(name)
    #self.all.detect{|song| song.name == name}
  #end

  #def self.find_or_create_by_name(name)
    #self.find_by_name(name)? self.find_by_name(name) : self.create(name)
  #end

  def artist=(artist)
    if @artist == nil
       @artist = artist
       @artist.songs << self
       @artist.add_song(self)
     end
   end

   def genre=(genre)
     if @genre == nil
        @genre = genre
        @genre.songs << self
        @genre.add_song(self)
      end
    end

    def self.new_from_filename(file_name)
      name = file_name.split(" - ")[1]
      artist = file_name.split(" - ")[0]
      genre = file_name.split(" - ")[2].gsub(".mp3", "")
      song = self.new(name)
      artist = Artist.find_or_create_by_name(artist)
      artist.add_song(song)
      genre = Genre.find_or_create_by_name(genre)
      genre.add_song(song)
      song
    end

    def self.create_from_filename(file_name)
      song = self.new_from_filename(file_name)
      song.save
      song
    end

end
