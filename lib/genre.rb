class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    newb = self.new(name)
    @@all << newb
    newb
  end

  def songs
    if @songs.uniq == @songs
      @songs
    else
      @songs.uniq!
    end
    return @songs
  end

  def self.all
     if @@all.uniq == @@all
      @@all
    else
      @@all.uniq!
    end
  end

  def self.print_all
    self.all.each {|i| puts "#{i.name}"}
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def print_songs
    @songs.each {|i| puts i.name}
  end

  def artists
    array = @songs.collect {|song| song.artist}
    if array.uniq == array
      array
    else
      array.uniq!
    end
  end

end