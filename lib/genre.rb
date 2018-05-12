class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all=[]
  def initialize(name)
    @name=name
    @songs=[]
  end

  def Genre.all
    @@all
  end

  def Genre.destroy_all
    @@all=[]
  end

  def save
    @@all<<self
  end

  def Genre.create(name)
     newGenre = new(name)
     newGenre.save
     newGenre
  end

  def artists
    artists = []
    @songs.each do |song|
      if artists.include?(song.artist)==false
        artists << song.artist
      end
    end
    artists
  end

end
