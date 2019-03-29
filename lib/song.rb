class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    # if artist
    #   self.artist = artist
    # end
    ####BETTER WRITTEN AS \/
    self.artist = artist unless artist.nil?

    self.genre = genre unless genre.nil?

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre

    # if !genre.songs.include?(self)
    #   genre.songs << self
    # end
    ###BETTER WRITTEN AS \/

    genre.songs << self unless genre.songs.include?(self)

  end


  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)

    created_song = Song.new(name).tap do |c_s| #<---using the TAP method removes the need to end this method with repetitive returns
      c_s.save
    end

  end


end
