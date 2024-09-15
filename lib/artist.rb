class Artist
  extend Concerns::Findable
  # include Concerns::Findable::InstanceMethods

  attr_accessor :name, :songs, :genres, :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end
    
  def self.create(name)
    new(name).tap{|artist| artist.save}
  end

  def add_song(song)        #     adds the song to the artist's song collection
    song.artist = self unless song.artist == self     #does not assign the artist to the song if the song already has the artist
    @songs << song unless @songs.include?(song)   #does not add the song to the artist's song collection if the artist already has the song
  end

  def genres
      songs.collect {|song| song.genre}.uniq
    # self.songs.collect {|x| x.genre}.uniq
    #artists have many genres through Song
  end

end