class Song
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end
  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre if @genre == nil
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def self.new_from_filename(file)
    parsed_file = file.gsub(".mp3", "").split(" - ")
    song_name = parsed_file[1]
    # binding.pry
    song = self.find_or_create_by_name(song_name)
    artist = Artist.find_or_create_by_name(parsed_file[0])
    genre = Genre.find_or_create_by_name(parsed_file[2])
    song.artist = artist
    song.genre = genre
    song
  end
  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
  end

  def self.destroy_all
    @@all.clear
  end

end

# song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")
