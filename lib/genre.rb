class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs =[]
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(genre)
    new(genre).tap{|g| g.save}
  end

  def artists
    songs.collect.each {|song| song.artist}.uniq
    # returns a collection of artists for all of the genre's songs
  end

    def save
      @@all << self
    end

    def self.create(name)
      new(name).tap { |s| s.save}
    end



end
