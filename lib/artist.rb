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

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)

    if song.artist == nil
      self.songs << song unless self.songs.include?(song)
      song.artist=(self)
    else
      self.songs << song unless self.songs.include?(song)
    end

  end

  def genres
    genre_list =
      self.songs.map do |song|
        song.genre unless song.genre == nil
      end
    genre_list.uniq
  end

end
