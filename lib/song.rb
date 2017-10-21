class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    @@all = []
    self.artist = artist
    self.genre = genre
  end

  def genre=(genre)
    @genre = genre
    if(genre != nil) && (!genre.songs.include?(self))
        genre.songs << self
      end
  end

  def self.find_by_name(song_name)
    @@all.first {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
      if(song == nil)
        #binding.pry
        self.create(song_name)
      else
        song
      end
  end

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end


  def artist=(artist)
    @artist = artist
    if(artist != nil)
      artist.add_song(self)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end



end
