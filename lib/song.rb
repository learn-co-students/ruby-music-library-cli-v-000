class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all=[]
  def initialize(name, artist=nil, genre=nil)
    @name=name
    if !artist.nil?
     self.artist=artist
    end
    if !genre.nil?
     self.genre=genre
    end
  end

  def self.create(name, artist=nil, genre=nil)
    song=self.new(name, artist, genre)
    song.save
    song
  end

  def self.all
    @@all 
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def artist=(artist)
   @artist=artist
   artist.add_song(self)
  end

  def genre=(genre)
   @genre=genre
   if !genre.songs.include?(self)
     genre.songs<<self
   end
  end

  def self.new_from_filename(filename)
    arr=filename.split(' - ')
    name=arr[1]
    artist=Artist.find_or_create_by_name(arr[0])
    genre=Genre.find_or_create_by_name(arr[2].split('.')[0])
    self.new(name,artist,genre)
  end

  def self.create_from_filename(filename)
    arr=filename.split(' - ')
    name=arr[1]
    artist=Artist.find_or_create_by_name(arr[0])
    genre=Genre.find_or_create_by_name(arr[2].split('.')[0])
    self.create(name,artist,genre)
  end


end