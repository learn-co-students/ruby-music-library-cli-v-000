class Genre
  extend Concerns::Findable 
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    ans = []
    @songs.each do |s|
      ans << s.artist if !ans.include?(s.artist)
    end
    ans
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
    ans = self.new(name)
    ans.save
    ans
  end
end