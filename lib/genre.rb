class Genre

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    artists_array = []
    self.songs.each do |song|
      if !!song.artist
        artists_array << song.artist
      end
    end
    artists_array.uniq
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self if !self.songs.include(song)
  end

  def self.all
    @@all
  end

  def has_song?(checked_song)
    self.songs.detect {|song| song == checked_song} ? true : false
  end

  def exists?
    self.class.all.detect {|genre| genre == self} ? true : false
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap do |new_song|
      new_song.save
    end
  end

end
