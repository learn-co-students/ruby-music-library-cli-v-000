class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs #name property readable and writeable by object

  @@all= [] #class variable, prepared to store all aved instances

  def initialize(name) #sets name on initialization
    @name= name  #sets property correctly
    @songs= []
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
    genre= Genre.new(name)  #instantiate an instance using .new
    genre.save  #evokes save on the instance created
    genre  #calls the genre immediately
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def add_song(song) #adding a song to an artist
    @songs << song unless @songs.include?(song)
    if song.genre == nil
      song.genre = self
    end
  end


end
