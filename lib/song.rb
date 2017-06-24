class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre= genre if genre != nil
  end

  #============================
  # INSTANCE METHODS
  #============================

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  #============================
  # CLASS METHODS
  #============================

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.create(name)
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    artist_name, song_name = file_array[0], file_array[1]
    genre_name = file_array.last.gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre) unless self.find_by_name(song_name)
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

  def self.sorted_song_list
    song_arr = Song.all.collect do |s|
      "#{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
    song_arr = song_arr.collect { |s| s.split(" - ")}
    song_arr = song_arr.sort_by { |s| s[1] }
    song_arr.collect { |s| s.join(" - ")}
  end

end
