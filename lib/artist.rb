class Artist
  extend Concerns::Findable

  attr_accessor :name, :all, :songs
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
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end

  def add_song(song)
    @songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    comprehensive_genre_list =[]
    songs.collect do |song|
      comprehensive_genre_list << song.genre
    end
    comprehensive_genre_list.uniq
  end

end
