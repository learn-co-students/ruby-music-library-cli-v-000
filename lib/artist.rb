class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    @songs << song if find_by_name(song) == nil
    song.artist = self unless song.artist == self
  end

  def find_by_name(song)
    self.songs.find{ |item| item == song}
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

end
