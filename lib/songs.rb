class Song

attr_accessor :name, :artist, :genre

  @@all = []
  extend Concerns::Findable

  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
     self.all.detect{|song| song.name == name}
   end

   def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end

  def genre=(genre)
    @genre = genre
    @genre.songs << self if !@genre.songs.include?(self)
  end




end
