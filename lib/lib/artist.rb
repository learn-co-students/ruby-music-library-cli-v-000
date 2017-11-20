class Artist
  extend Concerns::Findable
  attr_accessor :name, :song
  @@all = []
  def initialize(name)
    @name = name
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
    # create - saved instance
    artist = self.new(name)

    artist.save
    artist

  end
  def add_song(song)
    if songs.include?(song)

    else  @songs << song

      if !song.artist

        song.artist = self
      end
    end
  end

  def songs
    @songs
  end

  def genres

    self.songs.collect do |song|
      song.genre

end.uniq

end


end
