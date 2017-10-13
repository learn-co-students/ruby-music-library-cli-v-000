class Song
  attr_accessor :name, :artist, :genre
  @@all=[]


  def initialize(name, artist = ' ', genre= ' ')
    @name=name
    if artist != ' '
    self.artist=artist
    end
    if genre != ' '
      self.genre=genre
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    if genre.songs.include?(self)
    else
    genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(string)
    @@all.each do |song|
      if song.name == string
        return song
      else
      end

    end
    return nil
  end

  def self.find_or_create_by_name(string)
    if self.find_by_name(string) == nil
        song = Song.create(string)
    else
      self.find_by_name(string)
    end

  end

  def self.new_from_filename(file_name)
    file_name = file_name.gsub(".mp3","")
    new_song = Song.new(file_name.split(" - ")[1])
    new_song_artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    new_song.artist = new_song_artist
    new_song_artist.songs << new_song
    new_song_genre = Genre.find_or_create_by_name(file_name.split(" - ")[2])
    new_song.genre = new_song_genre
    new_song_genre.songs << new_song
    new_song
  end

  def self.create_from_filename(file_name)
    new_song= self.new_from_filename(file_name)
    new_song.save
  end
end
