class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name).tap {|song| song.save}
  end

  def add_song(song)
    if @songs.all? {|s| s != song}
      @songs << song
    end
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
