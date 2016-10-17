class Song

	@@all = []

	attr_accessor :name
  attr_reader :artist, :genre

	def initialize(name,artist=nil,genre=nil)
    @name = name
    if artist
      @artist = artist 
      artist.add_song(self)
    end
    if genre
      @genre = genre
      genre.songs << self
    end
	end

	def save
		@@all << self
	end

  def artist=(artist)
    @artist = artist
    if !artist.songs.include?(self)
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.all
  	@@all
  end

  def self.destroy_all
  	@@all.clear
  end

  def self.create(name)
  	new_song = self.new(name)
  	new_song.save
  	new_song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
