require_relative '../concerns/findable.rb'
# require_relative '../concerns/class_actionable.rb'
# require_relative '../concerns/instance_actionable.rb'

class Artist
  extend Concerns::Findable
  # extend Concerns::ClassActionable
  # include Concerns::InstanceActionable

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_entry = self.new(name)
    new_entry.save
    new_entry
  end

  def self.print_all
    self.all.each_with_index {|e, i| puts "#{i+1}. e"}
  end

  def initialize(name)
    self.name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = []
    @songs.collect do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end
end