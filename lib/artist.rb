class Artist

  extend Concerns::Findable



  attr_accessor :name

  @@all = []
  


  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Artist.new(name).tap {|artist| artist.save}
  end

  @song = []








end
