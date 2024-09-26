require_relative "./concerns/findable.rb"
require_relative "./concerns/sortable.rb"

class Genre
  extend Concerns::Findable
  extend Concerns::Sortable
  @@all = []
  attr_accessor :name, :songs

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    self.new(name).save
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.tap { |instance| instance.class.all << self }
  end

  def artists
    songs.map { |song| song.artist }.uniq
  end

  def add_song(song)
    song.genre ||= self
    songs << song unless songs.include?(song)
  end

  def sorted_songs
    songs.sort_by { |e| e.name }
  end
end
