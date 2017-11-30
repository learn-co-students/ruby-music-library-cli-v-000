class Artist
@@all = []
attr_accessor :name, :songs
extend Concerns::Findable
  def initialize(name)
    self.name = name
    self.songs = []
  end

  def self.all
    @@all #req instead of accessor by rspec, so can't casually overwrite I assume.  Prob should do this for songs as it's also internal.
  end

  def genres #shovel works, refactor with .tap or .map?
    temp = []
    self.songs.each do |song|
      if !temp.include?(song.genre)
        temp << song.genre
      end
    end
    temp
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

#This is passing but #genres is failing (inexplicably) maybe because of this
#2 separate tests, attach artist IF clear, attach @songs IF clear, this may be wrong
  def add_song3(song) #this may be the problem with genres, look at these tests closely.
      if !song.artist.is_a?(Artist) && !@songs.include?(song)#meet spec, don't overwrite existing artists instance in song/artist slot
        song.artist = self
        @songs << song #need to add test also for preexist / done, works
      end
  end

  def add_song(song) #fixed it, above passes but screws up genres
    if !song.artist.is_a?(Artist)
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end


end
