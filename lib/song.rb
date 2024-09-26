require_relative "../concerns/concerns.rb"
class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  extend Concerns::Findable

  def initialize(name,artist=nil,genre=nil)
    self.name = name

    if artist != nil
      self.artist = artist
    else
      @artist = nil
    end

    if genre != nil
      self.genre = genre
    else
      @genre = nil
    end
    
  end

  def self.create(name,artist=nil,genre=nil)
    song = Song.new(name,artist,genre)
    song.save
    song
  end

  def self.all
    @@all   
  end
  
  def self.destroy_all
    @@all = []
  end

  def save
    unless @@all.any? { |song| song.name == self.name }
      @@all << self
    end
  end

  def artist=(artist)
    if artist.class == Artist
      if self.class.all.all? { |saved_artist| saved_artist.name != artist.name }
        @artist = artist
        @artist.add_song(self)
        @artist
      else
        @artist = self.class.all.find { |saved_artist| saved_artist.name == artist.name }
      end
    end
  end

  def genre=(genre)
    if genre.class == Genre
      if self.class.all.all? { |saved_genre| saved_genre.name != genre.name }
        @genre = genre
        @genre.add_song(self)
        @genre
      else
        @genre = self.class.all.find { |saved_genre| saved_genre.name == genre.name }
      end
    end
  end

  def self.new_from_filename(filename)
    file_attributes = filename.split(" - ")
    file_attributes[2].chomp!(".mp3")
    artist = Artist.find_by_name(file_attributes[0])
    genre = Genre.find_by_name(file_attributes[2])
    artist ||= Artist.new(file_attributes[0])
    genre ||= Genre.new(file_attributes[2])
    self.new(file_attributes[1],artist,genre)
  end

  def self.create_from_filename(filename)
    file_attributes = filename.split(" - ")
    file_attributes[2].chomp!(".mp3")
    self.create(file_attributes[1],Artist.find_or_create_by_name(file_attributes[0]),Genre.find_or_create_by_name(file_attributes[2]))
  end

end