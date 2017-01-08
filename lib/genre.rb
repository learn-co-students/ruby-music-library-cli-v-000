class Genre

  extend Concerns::Findable
  attr_accessor :name, :songs, :artist


  @@all = []

  def initialize(name)
    @name =  name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

    def save
      self.class.all << self
    end

    def self.create(name)
      genre = Genre.new(name)
      self.all << genre
      genre
    end
    def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end

    def artists
      self.songs.collect{|x| x.artist}.uniq
    end

end
