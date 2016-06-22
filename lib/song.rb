class Song
  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def save
    @@all << self
  end

  def artist=(artist)
    if artist.is_a?(Artist)
      @artist = artist
    else
      @artist = Artist.find_or_create_by_name(artist)
    end
    @artist.add_song(self) unless @artist.songs.include?(self)
  end

  def genre=(genre)
    if genre.is_a?(Genre)
      @genre = genre
    else
      @genre = Genre.find_or_create_by_name(genre)
    end
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      return find_by_name(name)
    else
      return Song.create(name)
    end
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    song_info[2].slice!(".mp3")
    #binding.pry
    Song.new(song_info[1], song_info[0], song_info[2])
  end

  def self.create_from_filename(filename)
    song_info = filename.split(" - ")
    song_info[2].slice!(".mp3")
    Song.create(song_info[1], song_info[0], song_info[2])
  end


end