class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist # if keyword executes only if the if condition is true.
    self.genre = genre if genre #invoke genre= instead of @genre
    #@@all << self
  end

  def self.all
    @@all
  end

  #def self.destroy_all
  #  self.all.clear
  #end

  def save
    @@all << self
  end

#  def self.create(name)
#    self.new(name).tap { |song| song.save }
#  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre #assign genre to song
    @genre.songs << self unless @genre.songs.include?(self) #add song to genre array unless song is there already
  end

    #def self.find_or_create_by_name(name) #ternary operator can work here since I defined two methods - #find and #create and #tap works to puts song name after saving the song name
    #  self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    #end

    #def self.find_by_name(name)
    #  self.all.find { |song| song.name == name }
    #end

    def self.new_from_filename(filename)
      artist, name, genre = filename.gsub(".mp3", "").split(" - ")
      new_song = self.new(name)
      new_song.artist = Artist.find_or_create_by_name(artist)
      new_song.genre = Genre.find_or_create_by_name(genre)
      new_song
    end

    def self.create_from_filename(filename)
      new_song = self.new_from_filename(filename)
      new_song.save
      new_song
    end

end
