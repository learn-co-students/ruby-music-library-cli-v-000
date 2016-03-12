require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = Array.new

  def initialize(name, new_artist=nil, genre=nil)
    @name = name
    @artist = new_artist
    if new_artist != nil
      @artist.add_song(self)
    end
    if genre != nil
      genre.add_song(self)
    end
    @genre = genre
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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(thing)
    @artist = thing
    @artist.add_song(self)
  end

  def genre=(thing)
    @genre = thing
    if @genre.songs.include?(self) == false
      @genre.songs << self
    end
  end


  def self.new_from_filename(file)
    file.gsub!(/[.mp3]{4}/, '')
    names = file.split('-')
    song_name = names[1].strip
    new_artist = Artist.find_or_create_by_name(names[0].strip)
    new_genre = Genre.find_or_create_by_name(names[2].strip)
    Song.new(song_name, new_artist, new_genre)
  end
  
  def self.create_from_filename(file)
    file.gsub!(/[.mp3]{4}/, '')
    names = file.split('-')
    song_name = names[1].strip
    new_artist = Artist.find_or_create_by_name(names[0].strip)
    new_genre = Genre.find_or_create_by_name(names[2].strip)
    if new_genre.name == 'hip'
      new_genre.name << '-hop'
    end
    song = Song.create(names[1].strip)
    song.artist = new_artist
    song.genre = new_genre
    song
  end

  def self.print_songs
    all.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  private
  def self.find_artist(artist_name)
    Artist.find_by_name(artist_name)
  end

  def self.find_genre(genre_name)
    Genre.find_by_name(genre_name)
  end

  class SongError < StandardError
    def no_artist_error
      "Yo dude that artist is already there"
    end
  end
end
