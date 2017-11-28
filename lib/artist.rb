class Artist
@@all = []
attr_accessor :name, :songs
  def initialize(name)
    self.name = name
    @songs =[]
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

  def add_song(song)
    @songs << song #need to add test also for preexist
      if song.artist.is_a?(Artist) #meet spec, don't overwrite existing artists instance in song/artist slot
      else
        song.artist = self
      end
  end




end
