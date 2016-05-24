class Song
extend Concerns::Findable
attr_accessor :name, :artist, :genre, :artists

@@all = []


  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
      artist.add_song(self)
    end
    if genre != nil
      self.genre = genre
    end
    #genre.add_song(self)
  end

  # def artists
  #     unique_artists = []
  #     artists_array = self.artist.collect {|song|song.artist}
  #     artists_array.each do |artist| 
  #       if !unique_artists.include?(artist)
  #         unique_artists << artist
  #       end
  #     end
  #       unique_artists

  #   end

  def self.new_from_filename(filename)
    local = filename.split(" - ")
    artist = Artist.find_or_create_by_name(local[0])
    genre = Genre.find_or_create_by_name(local[2][0..-5])
    new_song = Song.new(local[1],artist,genre)
    #new_song
  end

  def self.create_from_filename(filename)
  local = filename.split(" - ")
  artist = Artist.find_or_create_by_name(local[0])
  genre = Genre.find_or_create_by_name(local[2][0..-5])
  new_song = Song.new(local[1],artist,genre)
  new_song.save
  new_song
end


  def save
  @@all << self

  end

  def self.create(name, artist = nil, genre = nil)
    new_song = self.new(name, artist, genre)
    new_song.save
    new_song
  end

  
  def artist=(artist)
  @artist = artist
  @artist.songs << self
  @artist.add_song(self)
  end

  def genre=(genre)
  @genre = genre
   if !@genre.songs.include?(self) 
    @genre.songs << self
  end
  
  end
 
  def self.find_by_name(name)
    @@all.detect {|song| name == song.name}
  end

  def self.find_or_create_by_name(name)
    if #(@@all.detect {|song| name == song.name}) 
      self.find_by_name(name)== nil
      self.create(name)
    else 
      self.find_by_name(name)
    end
    
  end


  def self.all 
    @@all 
  end

  def self.destroy_all
    @@all.clear
  end

end



























