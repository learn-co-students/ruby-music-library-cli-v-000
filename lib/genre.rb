class Genre

  extend Concerns::Findable
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap do |instance|
      instance.save
    end

    #Long-form code
      #genre = self.new(name)
      #genre.save
      #genre
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end