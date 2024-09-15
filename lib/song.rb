class Song
  attr_accessor :name, :artist, :genre
  
  @@all = [] 

  def initialize(name, artist = nil, genre = nil)
    @name = name  
    @@all << self 
    
    if artist.is_a?(Artist) 
      self.artist = artist 
    end
  

    if genre.is_a?(Genre)
      genre.songs << self 
      genre.artists << artist unless genre.artists.include?(artist) 
      artist.genres << genre unless artist.genres.include?(genre)
      self.genre = genre 
    end
  
  end

  def artist=(artist)
   @artist = artist if artist.is_a?(Artist)
   @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre if genre.is_a?(Genre)
    genre.songs << self unless genre.songs.include?(self)
  end

  def Song.all 
    @@all 
  end 

  def Song.destroy_all 
    self.all.clear 
  end

  def save 
    @@all
  end

  def Song.find_by_name(name)
    Song.all.each do |song|
      return song if song.name = name 
    end
  end

  def Song.find_or_create_by_name(name)
    if Song.all.all? { |song| song.name != name }
      Song.create(name)
    else
      Song.find_by_name(name)
    end
  end

  def Song.create(song)
    item = Song.new(song)
  end


  def self.new_from_filename(name)
    parsed_song = name.split(/\-|\./).map { |el| el.strip || el}.select { |el| el.length > 3 }
    Song.new(parsed_song[1], Artist.find_or_create_by_name(parsed_song[0]), Genre.find_or_create_by_name(parsed_song[2]))
  end

  def self.create_from_filename(song_name)
     self.new_from_filename(song_name)
  end

end
