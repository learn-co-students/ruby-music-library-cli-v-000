class Song
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist !=nil
      @artist = artist
      @artist.add_song(self)
    end

    if genre !=nil
      @genre = genre
      @genre.add_song(self)
    end
  end

  def self.all
    @@all
  end

  def artist=(name)
    @artist = name
    name.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(file)
    song = self.new(file.split(' - ')[1])
    song.artist = Artist.find_or_create_by_name(file.split(' - ')[0])
    song.genre = Genre.find_or_create_by_name(file.split(' - ')[2].chomp(".mp3"))
    @@all << song
    song
  end

  def self.create_from_filename(file)
    song = self.new(file.split(' - ')[1])
    song.artist = Artist.find_or_create_by_name(file.split(' - ')[0])
    song.genre = Genre.find_or_create_by_name(file.split(' - ')[2].chomp(".mp3"))
    @@all << song
    song.save
  end
end
