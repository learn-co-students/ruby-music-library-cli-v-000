require_relative '../config/environment'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

########## Instance Methods ##########
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if !song.is_a?(Song)
      # begin
        raise SongTypeError
      # rescue SongTypeError => error
      #   puts error.message
      # end
    else
      songs << song unless songs.include?(song)
      song.artist = self unless song.artist == self
    end
  end

  def save
    self.class.all << self
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  ########## Class Methods ##########

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end


  def self.create(name)
    Artist.new(name).tap {|new_instance| new_instance.save}
  end

end

class SongTypeError < StandardError
  def message
    "Cannot add a non-Song type object."
  end
end


# jayz = Artist.create('jayz')
# binding.pry
# jayz.add_song(new_song)
# jayz.add_song('new_song')
# puts jayz.songs.each {|song| puts song.name}
