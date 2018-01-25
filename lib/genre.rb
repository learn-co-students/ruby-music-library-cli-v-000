class Genre
  #accepts a name upon initialization and set that property
  #name property should be readable and writable by object
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def destroy_all
    @@all.clear
  end

  def create
    self.new.save
  end



end
