class Song
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  include Concerns::Findable::InstanceMethods
  extend Concerns::Findable::ClassMethods

  attr_accessor :name, :artist
  attr_reader :genre

  @@all = []

  def initialize(name, artist = nil,genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    save
  end

  def self.all
    @@all
  end

  def self.create(name)
    Song.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless @artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless @genre.songs.include?(self)
  end

  def self.find_or_create_by_name(name)
    o = self.all.detect { |o| o.name == name}
    if o == nil
      Song.new(name)
    else
      o
    end
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    song = Song.new(song_info[1])
    song.artist = Artist.find_or_create_by_name(song_info[0])
    song.genre = Genre.find_or_create_by_name(song_info[2].sub!(/.mp3/, ''))
    song
  end

  def self.create_from_filename(filename)
    #####################################
    song_info = filename.split(" - ")
    artist = song_info[0]
    name  = song_info[1]
    genre = song_info[2]
    #####################################
    song = Song.new(name)
    song.name = name
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre.sub!(/.mp3/, ''))
    #####################################
    song


  end

end
