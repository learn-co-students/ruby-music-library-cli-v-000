class Genre
  attr_accessor :name, :songs

  extend Concerns::Findable

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
    @@all << self
  end

  def self.create(name)
   new(name).tap{|x| x.save}
  end

  def artists
   self.songs.collect {|x| x.artist} .uniq
  end

end
