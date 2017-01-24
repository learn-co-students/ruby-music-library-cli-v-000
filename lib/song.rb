require_relative "concerns.rb"

class Song

  extend Concerns::Findable

  attr_reader :artist, :genre
  attr_accessor :name


  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) #if !artist.songs.include? self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
    artist.genres << genre if !artist.nil? && !artist.genres.include?(genre)
  end

  def self.new_from_filename(filename)
    file_info = parse_filename(filename)
    new(file_info[:song_name]).tap do |song|
      song.artist = file_info[:artist]
      song.genre = file_info[:genre]
    end
  end

  def self.create_from_filename(filename)
    file_info = parse_filename(filename)
    create(file_info[:song_name]).tap do |song|
      song.artist = file_info[:artist]
      song.genre = file_info[:genre]
    end
  end

  def self.parse_filename(filename)
    file_info = filename.split((/\s\-\s|\.mp3/))
    song_name = file_info[1]
    artist = Artist.find_or_create_by_name(file_info[0])
    genre = Genre.find_or_create_by_name(file_info[2])
    {song_name: song_name, artist: artist, genre: genre}
  end

  def to_s
    "#{artist.name} - #{name} - #{genre.name}"
  end

end
