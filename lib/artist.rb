class Artist
  extend Concerns::Findable  #takes methods in module into class methods
  # extend Persistable::ClassMethods
  # extend Nameable::ClassMethods
  # include Persistable::InstanceMethods
  attr_accessor :name, :songs, :genres

  @@all =[]

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
     @songs << song unless @songs.include?(song)
     song.artist = self if !song.artist #song belongs to artist. expect(song.artist).to be(artist)
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

  def self.create(artist)
    self.new(artist).tap {|artist| artist.save}
end

  def songs
    @songs
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def self.find_by_name(name)
    @@all.detect{|artist| artist.name == name}
  end

end

# def self.all
#   @@all
# end
#
# def initialize
#   save
# end
