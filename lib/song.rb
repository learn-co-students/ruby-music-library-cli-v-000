class Song

  attr_accessor :name, :artist, :genre
  @@all = []


  def initialize(name)
    @name = name
    
    # @artist = artist
    # @genre = genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self

  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    # song = self.new
    # song.save
    # song
    # new(name).tap {|s| s.save}
    # Or, as a one-liner:
    new(name).tap{ |s| s.save }

  end
end
