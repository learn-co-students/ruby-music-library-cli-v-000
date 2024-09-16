class Song
  extend Group::ClassMethods
  include Group::InstanceMethods
  attr_accessor :name, :songs, :all
  attr_reader :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if genre != nil
      self.genre=(genre)
    else
      @genre = genre
    end

    # @genre = genre
    if artist != nil
      self.artist= (artist)
    else
      @name = name
      @artist = artist


      @@all << self
    end
  end

  def self.all
    @@all
  end

  def artist=(artist)
     @artist = artist
     artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    all.find{|i| i.name == name}
  end

  def create(name)
    initialize(name)
  end


  def self.find_or_create_by_name(name)
    if !find_by_name(name)
       create(name)
     else
       find_by_name(name)
    end
  end


  def self.new_from_filename(filename)
    song_name = filename.split(' - ')[1]
    artist_name = filename.split(' - ')[0]
    genre = filename.split(' - ')[2].gsub('.mp3', '')
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre)

    if !find_by_name(song_name)
      Song.new(filename.split(' - ')[1], artist, genre)

    end

  end

  def self.create_from_filename(filename)

      @@all << new_from_filename(filename)


    end

end
