class Song
  attr_accessor:name,:artist,:genre

  @@all =[]

  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name, artist = nil,genre=nil)
    self.new(name, artist,genre).tap{|s| s.save}
  end

  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name): self.create(name)
  end

  def self.new_from_filename(filename)
    songinfo = filename.split(" - ")
    song_name = songinfo[1]
    artist = Artist.find_or_create_by_name(songinfo[0])
    genre = Genre.find_or_create_by_name(songinfo[2].gsub(".mp3",""))
    self.new(song_name, artist,genre)
  end

 def self.create_from_filename(filename)
  songinfo = filename.split(" - ")
    song_name = songinfo[1]
    artist = Artist.find_or_create_by_name(songinfo[0])
    genre = Genre.find_or_create_by_name(songinfo[2].gsub(".mp3",""))
    self.create(song_name, artist,genre)
  end


end
