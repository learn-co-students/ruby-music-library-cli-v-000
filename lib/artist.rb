class Artist
extend Persistable::ClassMethods
include Persistable::InstanceMethods
include Concerns::Findable::InstanceMethods
extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    save
    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
    Artist.new(name)
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist != nil
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

end
