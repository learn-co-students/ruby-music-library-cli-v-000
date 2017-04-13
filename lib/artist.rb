class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.save unless self.class.all.include?(self)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def save
    @@all << self
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Artist.new(name).tap{|new_artist| new_artist.save}
  end

  def self.list
    puts "Please type the name of the artist!"
    super
  end
end
