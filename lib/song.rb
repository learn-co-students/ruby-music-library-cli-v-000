class Song
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    puts "song = #{song}"
    puts "@@all1 = #{@@all}"
    song.save
    puts "@@all2 = #{@@all}"
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

end
