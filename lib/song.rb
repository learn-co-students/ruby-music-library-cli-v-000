class Song
attr_accessor :name, :genre, :artist
extend Concerns::Findable
@@all = []

# Constructors

  def initialize(name)
    @name = name
=begin
    if genre
      self.genre=(genre)
    end
    if artist
      self.artist=(artist)
    end
=end
  end

  def self.new_from_filename(file_name)
    file_info = file_name.split(" - ")
    new_song = self.new(file_info[1])
    new_song.artist = file_info[0]
    new_song.genre = file_info[2].gsub(".mp3", "")
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
  end

  # Custom Setters

  def artist=(artist)
    @artist = Artist.find_or_create_by_name(artist)
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = Genre.find_or_create_by_name(genre)
    @genre.songs << self if !@genre.songs.include?(self)
  end

# Class Methods

  def self.all
    @@all
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

  #Instance Methods

  def save
    self.class.all << self
  end

end
