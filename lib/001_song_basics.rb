require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=artist
    end
    if genre !=nil
      self.genre=genre
    end
    self.save
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

  def self.create(name)
    Song.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(file_name)
    new_file = file_name.chomp('.mp3')
    file_array = new_file.split(' - ')
    song_name= file_array[1]
    artist_name = file_array[0]
    genre_name =file_array[2]


    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end



end
