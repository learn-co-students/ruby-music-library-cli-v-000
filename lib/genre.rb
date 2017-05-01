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

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.sort
     @@all.sort! { |a, b|  b.name <=> a.name}
   end

   def to_s
     self.name
   end

  def self.create(name)
    Genre.new(name).tap {|genre| genre.save}
  end

  def artists
    @songs.collect {|s| s.artist}.uniq
  end

end
