class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.create(name, artist=nil, genre=nil)
    new_song = Song.new(name, artist, genre)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
     if self.find_by_name(name) != nil
       return self.find_by_name(name)
     end
     self.create(name)
   end

   def self.new_from_filename(filename)
     filename.slice!(".mp3")
     split_filename = filename.split(" - ")
     new_artist = Artist.find_or_create_by_name(split_filename[0])
     new_genre = Genre.find_or_create_by_name(split_filename[2])
     song = Song.new(split_filename[1], new_artist, new_genre)
   end

   def self.create_from_filename(filename)
     self.new_from_filename(filename).save
   end


end
