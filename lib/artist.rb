class Artist
  extend Concerns::Findable
  attr_accessor :name,:songs
  @@all=[]
  def initialize(name)
    @name=name
    @songs=[]
  end

  def Artist.all
    @@all
  end

  def Artist.destroy_all
    @@all=[]
  end

  def save
    @@all<<self
  end

  def Artist.create(name)
     newArtist = new(name)
     newArtist.save
     newArtist
  end

  def add_song(song)
    if song.artist==nil
      song.artist =self
    end
    if songs.include?(song)==false
      songs<<song
    end
    song
  end

  def genres
    genres = []
    @songs.each do |song|  #while i is less than the length of @songs add song.genre to genres
      if genres.include?(song.genre)==false
        genres << song.genre
      end
    end
    genres
  end



end
