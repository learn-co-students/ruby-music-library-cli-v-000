class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.create(name)
    new(name).tap { |song| song.save }
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.gsub(".mp3", "").split(" - ")
    song = self.find_or_create_by_name(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.print_songs
    all.sort_by! { |s| s.artist.name }
    all.each.with_index { |s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end

  def self.play_song(song)
    s = all[song.to_i]
    puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
end
