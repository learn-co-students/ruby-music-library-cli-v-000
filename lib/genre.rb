require_relative "../config/environment.rb"

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
    @@all << self
  end

  def self.create(name)
    #why does this work?
    #what is new(name) doing?
    new(name).tap {|gen| gen.save}
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def to_s
    self.name
  end

end
