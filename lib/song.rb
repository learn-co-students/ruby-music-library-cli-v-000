class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil) #artist & genre are default arg set to nil unless a value is passed in
    @name = name
    self.artist = artist if artist != nil #sets artist value for song class if a value is sent, otherwise = nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self #pushes 'this instance' of Song to the entire Class of Self(Song)
  end

  def self.create(name)
    song = self.new(name) #create new instance of Song and sets the song name = to name arg passed in
    song.save #save this instance
    song #return
  end

  def artist=(artist)  #setter method
    @artist = artist
    artist.add_song(self) #add song to Artist collection
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? true : genre.songs << self #does the genre.songs array include this song/self?
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name} #iterate thru array, check for song name which = name passed in
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    song_title = filename.split(" - ")[1] #split filename into array at the "-"
    artist_name = filename.split(" - ")[0]
    genre_type = filename.split(" - ")[2].gsub(".mp3", "") #parse off .mp3
    song = self.find_or_create_by_name(song_title) #check if song already exists before adding it
    song.artist = Artist.find_or_create_by_name(artist_name) #set artist attribute for new song
    song.genre = Genre.find_or_create_by_name(genre_type) #set genre attribute for new song
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
