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
    @@all.clear
  end

  def save
    self.class.all << self unless self.class.all.include?(self)
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre

    #can also do:
    #new(name).tap{|genre| genre.save}
  end

  def artists
    artists = songs.collect {|song| song.artist}
    artists.uniq

    #or:
    #self.songs.collect{|song| song.artist}.uniq
  end

  def self.print_genres
    all.each {|genre| puts genre.name}
  end
end