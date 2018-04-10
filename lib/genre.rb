class Genre
  extend Concerns::Findable
  attr_accessor  :genre, :name
  @@all=[]

  def initialize(name )
    self.name = name if name
    @songs=[]
    save
    # self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(string)
      new_genre = Genre.new(string)
  end

  def songs
    @songs
  end

  def add_song(song)
     self.songs << song unless @songs.include?(song)
      self.artist << song.artist unless @songs.include?(song)
      song.genre = self if song.genre.nil?
  end

  def artists
     artists =  self.songs.collect do |song|
        song.artist
      end
      artists.uniq
  end
  # def self.create(name)
  #    new(name).tap{|s| s.save}
  #  end

end

# class Genre
# +  extend Concerns::Findable
# +  attr_accessor :name, :songs
# +
# +  @@all = []
# +
# +  def initialize(name)
# +    @name = name
# +    @songs = []
# +
# +    save
# +  end
# +
# +  def self.all
# +    @@all
# +  end
# +
# +  def self.destroy_all
# +    self.all.clear
# +  end
# +
# +  def save
# +    @@all << self
# +  end
# +
# +  def self.create(string)
# +    new_genre = Genre.new(string)
# +  end
# +
# +  def add_song(song)
# +    self.songs << song unless @songs.include?(song)
# +    self.artist << song.artist unless @songs.include?(song)
# +    song.genre = self if song.genre.nil?
# +  end
# +
# +  def artists
# +   artists =  self.songs.collect do |song|
# +      song.artist
# +    end
# +    artists.uniq
# +  end
# +
# +end
