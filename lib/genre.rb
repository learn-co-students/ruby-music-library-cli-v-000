class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap{|genre| genre.save}
  end

##Instance methods##

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    outs = self.songs.collect do |song|
      song.artist
    end
    outs.uniq
  end
end
