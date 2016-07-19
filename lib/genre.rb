class Genre
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  attr_accessor :name, :artist, :song
  attr_reader :songs
  @@all = []

  def initialize(name, song = nil, genre = nil)
    @name = name
    @songs = []
    @song = song
    self.genre = genre if genre
    self.artist = artist if artist
  end

  def self.all
    @@all
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def add_genre(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def artists
    new_array = self.songs.collect {|song| song.artist}
    new_array.uniq
  end
end
