class Song
  extend Memorable::ClassMethods
  extend Concerns::Findable
  include Memorable::InstanceMethods

  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name

    unless artist == nil
      self.artist=(artist)
    end

    unless genre == nil
      self.genre=(genre)
    end

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)

  end

  def self.all
    @@all.sort!{|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    array = filename.split(/\s-\s/)
    array[-1] = array[-1].chomp('.mp3')

    song = self.new(array[1].strip)
    artist = Artist.find_or_create_by_name(array[0].strip)
    genre = Genre.find_or_create_by_name(array[2].strip)
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
    song
  end

end
