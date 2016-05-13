class Genre
  extend Concerns::Findable
  attr_accessor :name, :all, :songs, :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    @songs << song unless self.songs.include?(song)
    song.genre=self unless song.genre == self
  end

  def artists
    all_artists = []
    self.songs.each do |song|
      all_artists << song.artist
    end
    all_artists.uniq
  end

end
