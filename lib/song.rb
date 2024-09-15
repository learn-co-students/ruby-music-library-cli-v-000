class Song 
  attr_accessor :name, :artist, :genre
 
  extend Concerns::Findable
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist    
    self.genre = genre if genre
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|song| song.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
        self.all.clear
      end    

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(mp3)
    mp3_file = mp3.split(" - ")
    name = mp3_file[1]
    song = Song.new(name)
    song.genre = Genre.find_or_create_by_name(mp3_file[2].gsub(/\.mp3/, ""))
    song.artist = Artist.find_or_create_by_name(mp3_file[0])
    song
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).tap{|x| x.save}
    # puts your object into a block and then saves it inside the block but returns the original object
    # song = new_from_filename(filename)
    # song.save
    # song
  end



end
