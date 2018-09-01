class Genre
  attr_accessor :name
  attr_reader :songs

  @@all = []

  extend Concerns::Findable
  include Concerns::Persistable::InstanceMethods
  extend Concerns::Persistable::ClassMethods

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|genre| genre.save}
  end

  def add_song(song)
    unless self.songs.include?(song) then self.songs << song
    end
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end

  def self.all
    @@all
  end
end
