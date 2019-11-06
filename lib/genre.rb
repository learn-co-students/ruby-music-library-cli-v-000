class Genre
@@all = []
attr_accessor :name
attr_reader :songs
extend Concerns::Findable

  def initialize(name)
    @songs = []
    self.name = name
  end

  def songs
    @songs
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
    self.new(name).tap do |name|
      name.save
    end
  end

  def artists
    temp = []
    self.songs.each do |song|
      if !temp.include?(song.artist)
        temp << song.artist
      end
    end
    temp
  end

end
