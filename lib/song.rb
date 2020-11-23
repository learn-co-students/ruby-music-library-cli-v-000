class Song
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

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  #artist= method sets the song object to belong to the artist
  #invokes Artist#add_song to add itself to the artist's collection of songs
  #(artist has many songs)
  def artist= artist#setter is used for overwriting the default code in attr_accessor for custom work
    @artist = artist
    artist.add_song(self)#this collaborates with Artist class def add song
  end

  def genre= genre
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

#finds a song instance in @@all by the name property of the song
  def self.find_by_name(name) #accepts a string
    #iterates over @@all to check for matching song names
    self.all.find { |song| song.name == name }#checking each song objects name attr in array
  end                #|song| :give access to each element one at a time in the array
end                  #song.name :gives access to the name attr of every song object in array
                    #==name :then compares the accessed info to the name arg passed in

def self.find_or_create_by_name(name)
#  self.find_by_name(name) || self.create_by_name(name)
end

#class constructor
# initializes a song and saves it to the @@all class variable either literally or through the class method Song.all
  #def self.create
    #make a new instance
  #  song = self.new
  #  song.save
  #  song
  #end

  #def self.new_by_name(name)
  #     make a new instance
  #    song = self.new       #new instance
  #    song.name= name          # giving the song instance a name attribute. call a method on it that will allow us to name it as the song_name
  #    song                            #access to an instance of the Song class
  #  end

#class constructor
#class method takes in the string name of a song
#returns a song instance with that name set as its name property
#  def self.create_by_name(name) #takes in a string
  #make a new instance
#  song = self.create # returns an object that stored in the class variable  or the array
#  song.name = name #setting the saved object name attribute

#  song #return new song
#  end
#this is a class finder
#  def self.find_by_name(name) #accept a string
    #I need to iterate over @@all to check for matching song names
#  self.all.find { |song| song.name == name }# checking each song objects name attribute in the array
  #end                   #|song| gives access to each element one at a time in the array
                      #song.name gives access to the name attribute of every song object in array
                      #==name is then comparing the accessed information to the name argument passed in


#def self.find_or_create_by_name(name)
#   self.find_by_name(name) || self.create_by_name(name)
#  end

#  def self.alphabetical                    #this is a class method
#    self.all.sort_by { |song| song.name}   #{apple pear fig}.sort_by { |word| word.length }
#  end

#  def self.new_from_filename(filename)  #this ia a class constructor. A constructor 1.Allocates space for the object
#    song = self.new #new instance       #2.assigns instance variables their initial value #3. Returns the instance of that class
#    split_filename = filename.chomp(".mp3").split(" - ") #need to split filename up and remove the end of string
#    song.name = split_filename[1]
#    song.artist_name = split_filename[0]
#    song
#  end

#  def self.create_from_filename(filename) #this is a class constructor
#    song = self.create #returns the instance of Song which has an object ID
#    split_filename = filename.chomp('.mp3').split(" - ") #need to split filename int an array of strings,remove the end of string
#    song.name = split_filename[1] # setting the name attribute equal to the element at the index in split_filename
#    song.artist_name = split_filename[0]
#    song  # returns object Id wich now has the attributes that we set in line 64 and 65
#  end

#  def self.destroy_all
  #  @@all = [] #or self.all.clear
  #end
