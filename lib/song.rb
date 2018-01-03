class Song
  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    created_song = self.new(name)
    created_song.save
    created_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

 def genre=(genre)
   @genre = genre
   if(genre != nil) && (!genre.songs.include?(self))
       genre.songs << self
     end
 end

 def self.find_by_name(name)
   self.all.detect {|song| song.name == name}
 end




 def self.find_or_create_by_name(name)
   same_song = self.find_by_name(name)

   if self.all.include?(same_song)
     same_song
   else
     self.create(name)
   end

 end
end
