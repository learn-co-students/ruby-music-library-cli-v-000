class Artist

  extend Concerns::Findable

  attr_accessor :name, :genre, :songs #name property readable and writeable by object

  @@all= [] #class variable, prepared to store all aved instances

  def initialize(name) #sets name on initialization
    @name= name  #sets property correctly
    @songs= []  #songs initialized with optional Artist argument
  end

  def self.all
    @@all
  end

  def save #method adds instance itself into the class variable @@all
    @@all << self
  end

  def self.destroy_all #method empties all array of @@all
    @@all.clear
  end

  def self.create(name)
    artist= Artist.new(name)  #instantiate an instance using .new
    artist.save  #evokes save on the instance created
    artist  #calls the genre immediately
  end

  def add_song(song) #adding a song to an artist
    @songs << song unless @songs.include?(song)
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end


end
