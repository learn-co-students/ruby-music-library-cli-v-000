class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre != nil
      if !genre.songs.include?(self)
      genre.songs << self
    end
  end
 end

 def self.new_from_filename(file)
   file = file.chomp(".mp3").split(" - ")
   if self.find_by_name(file[1]) == nil
     new_song = self.new(file[1])
     new_song.artist = Artist.new(file[0])
     new_song.genre = Genre.new(file[2])
     new_song
   else
     find_by_name(file[1])
   end
 end

 def self.create_from_filename(file)
   self.new_from_filename(file).save
 end



end
