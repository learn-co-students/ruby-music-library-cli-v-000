class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|s| s.save}
    # new_one = self.new(name)
    # self.all << new_one
    # new_one
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def add_song(song_instance)
    songs << song_instance unless songs.include?(song_instance)
    song_instance.artist ||= self
    # if self.has_song?(song_instance) == false
    #   self.songs << song_instance
    # end
    # if song_instance.artist == nil
    #   song_instance.artist = self
    # end
  end

  # def has_song?(song_instance)
  #   self.songs.include?(song_instance)
  # end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end
end
