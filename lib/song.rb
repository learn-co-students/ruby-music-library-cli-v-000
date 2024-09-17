class Song
  extend Concerns::Findable  #takes methods in module into class methods
  # extend Persistable::ClassMethods
  # extend Nameable::ClassMethods
  # include Persistable::InstanceMethods

  attr_accessor :name
    @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song)
    self.new(song).tap {|song| song.save}
  end

  def artist=(artist) #bc its an optional argument above!
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    #adds the song to the genre's collection of songs (genre has many songs) UNLESS the song already exists
  end

  def genre
    @genre
  end

    def self.find_by_name(name)
      @@all.detect{|o| o.name == name}
    end

    def save
      @@all << self
    end

    def self.find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
        create(name)
      end
    end

    def self.new_from_filename(filename)
      artist_name, song_name, genre_name = filename.split(" - ")
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name.gsub(/.mp3/,""))
      Song.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
      song = new_from_filename(filename).save
    end



  # def self.all
  #   @@all
  # end
  #
  # def initialize
  #   save
  # end

end
