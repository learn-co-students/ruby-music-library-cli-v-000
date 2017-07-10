class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = Array.new
  end

  def save
    @@all << self
    self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=artist if artist
    self.genre=genre if genre
  end

  def self.create(name)
    Song.new(name).save
  end

  def self.find_by_name(name)
    @@all.detect{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create(name)
    end
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(" - ")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name.gsub(/.mp3/,""))
    Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename).save
    song
  end

  def self.sort_songs
    @@all.sort_by!{|song| song.name}
  end

  def self.list_songs
    sort_songs
    i = 1
    @@all.each do |song|
      puts("#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}")
      i+=1
    end
  end

end
