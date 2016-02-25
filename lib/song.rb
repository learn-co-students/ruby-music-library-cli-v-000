class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist!=nil
      self.artist=artist
    end
    if genre!=nil
      self.genre=genre
    end
  end

  def self.all
    @@all
  end

  def self.list_all
    self.all.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    return nil
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    return new_song
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_title = parts[1]
    song_genre = parts[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.find_or_create_by_name(song_title)
    genre = Genre.find_or_create_by_name(song_genre)
    song.artist = artist
    song.genre = genre
    return song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_title = parts[1]
    song_genre = parts[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.find_or_create_by_name(song_title)
    genre = Genre.find_or_create_by_name(song_genre)
    song.artist = artist
    song.genre = genre
    return song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs.push(self)
    end
  end

  def self.play_song(song_number)
    now_playing = Song.all[song_number-1]
    puts "Playing #{now_playing.artist.name} - #{now_playing.name} - #{now_playing.genre.name}"
  end

  def save
    @@all.push(self)
  end
end
