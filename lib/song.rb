class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self if @genre.songs.none? {|s| s.name == self.name}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.create(name)
    song = Song.new(name)
    @@all << song
    @@all.last
  end

  def self.find_by_name(song)
    @@all.detect{|s| s.name == song}
  end

  def self.find_or_create_by_name(song)
    inquiry = self.find_by_name(song)
    if inquiry
      inquiry
    else
      create(song)
    end
  end

  def self.new_from_filename(file)
    parsed_file = file[0..-5].split(" - ")
    song = parsed_file[1]
    artist = parsed_file[0]
    genre = parsed_file[2]
    isong= Song.find_or_create_by_name(song)
    isong.artist = Artist.find_or_create_by_name(artist)
    isong.genre = Genre.find_or_create_by_name(genre)
    isong
  end

  def self.create_from_filename(file)
    new_from_filename(file).tap {|song| song.save}
  end
end
