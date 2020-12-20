class Song
  extend Concerns::Findable #take all of the methods in the Findable module and add them as class methods
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil) #optional arguments set to nil
    @name = name
    if artist != nil #conditional that checks for artist value
      self.artist = artist #assigns artist to instance of song
    end
    if genre != nil #conditional that checks for genre value
      self.genre = genre #assigns genre to instance of song
    end
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
    song = Song.new(name) #creates new instance
    song.save             #saves t0 @@all array
    song
  end

  #artist= method sets the song object to belong to the artist
  #invokes Artist#add_song to add itself to the artist's collection of songs
  #(artist has many songs)
  def artist= artist #setter is used for overwriting the default code in attr_accessor for custom work
    @artist = artist #
    artist.add_song(self) #this collaborates with Artist class def add song
  end

  def genre= genre
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

                                 #finds a song instance in @@all by the name property of the song
  def self.find_by_name(name)    #iterates over @@all to check for matching song names
    self.all.find { |song| song.name == name }#checking each song objects name attr in array
  end                #|song| :give access to each element one at a time in the array
                 #song.name :gives access to the name attr of every song object in array
                    #==name :then compares the accessed info to the name arg passed in

  #def self.find_or_create_by_name(name)
  #  self.find_by_name(name) || self.create(name)
  #end

  def self.new_from_filename(filename)
    split_filename = filename.chomp('.mp3').split(" - ") #returns array
    artist = Artist.find_or_create_by_name(split_filename[0])
    genre = Genre.find_or_create_by_name(split_filename[2])
    Song.new(split_filename[1], artist, genre)
  end

  def self.create_from_filename(filename)
    @@all << Song.new_from_filename(filename)
  end
end
