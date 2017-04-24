class Song

  attr_accessor :name
  attr_reader :artist, :genre
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  @@all=[]
  def initialize(name, artist=nil, genre=nil)
    self.name=name
    self.artist=artist if artist
    self.genre=genre if genre
  end
  def artist= (artist)
    @artist=artist
    artist.add_song(self)
  end
  def genre= (genre)
    @genre=genre
    genre.add_song(self)
  end
  def self.find_by_name(name)
    all.detect{|song| song.name==name}
  end
  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if !song
      song = Song.new(name)
      song.save
    end
    song
  end
  def self.all
    @@all
  end

end
