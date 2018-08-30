class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  extend Concerns::Findable

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    if artist != nil then self.artist=(artist)
    end
    if genre != nil then self.genre=(genre)
    end
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(file)
    # binding.pry
    file_artist = Artist.find_or_create_by_name(file.split(" - ")[0].strip)
    file_songname = file.split(" - ")[1].strip
    file_genre = Genre.find_or_create_by_name(file.split(" - ")[2].gsub(".mp3", "").strip)
    song = Song.new(file_songname, file_artist, file_genre)
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
