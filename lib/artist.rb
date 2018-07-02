class Artist
  attr_accessor :name, :songs
  @@all = []
  #adds find_by_name and find_or_create_by_name options
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
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

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist.nil?
      song.artist = self
    end
    if !@songs.include?(song)
       @songs << song
     end
  end

  def genres
     @songs.collect {|s| s.genre}.uniq
   end



end
