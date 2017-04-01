class Genre

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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
   genre = self.new(name)
   genre.save
   genre
  end

  def add_song(song)
    song.genre = self unless song.genre != nil
    @songs << song unless songs.include?(song)
  end

  def artists
    aartists = []

    songs.each do |song|
      aartists << song.artist unless aartists.include?(song.artist)
    end

    aartists

  end



end
