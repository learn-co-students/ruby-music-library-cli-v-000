class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all =[]

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.create(name)
    new(name).tap{|a| a.save}
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

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end


  def genres
    genres = self.songs.collect do |song|
      song.genre
    end
    genres.uniq
  end



end
