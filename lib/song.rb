require 'pry'
class Song
  #Ask in slack what to use for screen recording.
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    #self.genre = genre if genre
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
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

  def self.find_by_name(name)
    all.find {|song| song.name == name}
    #all.find(&:name) was causing problems ^ this is better
    #despite how it looks it uses the parameter to find
    #the specfic song object by name in @@all array
  end

  def self.find_or_create_by_name(name)
    #in pry play -l 42 means run the code on line 4
    find_by_name(name) || create(name) #basically create is like .new
    #self.create is implied with create.
  end

  def self.create(name)
    song = new(name)
    song.save
    song #was giving a nested array and was expecting a song return
  end

  def self.new_from_filename(name)
    artist, song, genre = name.split(' - ')
    fixed_name = genre.gsub('.mp3','')
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(fixed_name)
    new(song, artist, genre)
  end

  def self.create_from_filename(name)
    new_from_filename(name).save
  end




end
