class Genre

  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
      song = Genre.new(name)
      song.save
      song
  end

  def add_song(song)
    if songs.include?(song) == false
    @songs << song
    end
    # only set the genre of the song object if it's currently blank (to prevent infinite loop)
    # see explaination in artist class.
    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    array = []
    songs.each do |song|
      array << song.artist
    end
    array.uniq
  end


end
