class Artist
  include Concerns
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @all << self
  end

  def destroy_all
    @all.clear
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def add_song(song)
    @songs << song
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end
  end
end
