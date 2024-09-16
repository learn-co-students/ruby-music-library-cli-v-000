class Genre
  attr_accessor :name, :songs
  @@all=[]


  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    artists_array = []
    self.songs.each do |song|
      if artists_array.include?(song.artist) == false
        artists_array.push(song.artist)
      end
    end
    artists_array
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all=[]
  end

  def save
    @@all.push(self)
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save[0]
    new_genre
  end

end
