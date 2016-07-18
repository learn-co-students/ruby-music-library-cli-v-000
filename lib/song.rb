class Song

  attr_accessor :name, :artist

  @@all =[]

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self # makes the code more reusable
  end

  # instantiates an instance using .new but also evokes #save on that instance, forcing it to persist immediately.
  def self.create(song)
    song = Song.new(name)
    song.save
    song
  end


    def artist=(artist)
      # song = Song.new(name)
      # artist.songs << add_song(song)
      # @@all
      artist = artist.add_song(song)
      # binding.pry
      # song=Song.new(name)
      # artist.songs
    end

end
