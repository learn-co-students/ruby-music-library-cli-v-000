class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  # Instance Methods
  def initialize(name)
    self.name = name
    @songs = []
  end

  def save
    self.class.all << self
  end
  #  Class Methods
  def self.all
    @@all
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect {|s| s.artist}.uniq
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Genre.new(name).tap{|g| g.save}
  end

end  # End of Class
