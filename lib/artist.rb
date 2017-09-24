class Artist
  
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name, songs = [])
    @name = name
    @songs = songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end


  def genres
    self.songs.map{|song| song.genre}.uniq
  end



end
