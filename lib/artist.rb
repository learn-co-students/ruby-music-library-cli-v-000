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
      if !song.artist.is_a?(Artist) && !@songs.include?(song)#meet spec, don't overwrite existing artists instance in song/artist slot
        song.artist = self
        @songs << song #need to add test also for preexist / done, works
      end
  end




end
