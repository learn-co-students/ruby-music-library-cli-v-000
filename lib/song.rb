require "pry"
class Song
  #extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all=[]
  def initialize(name,artist=nil,genre=nil)
    @name=name

    if artist != nil
      self.artist=artist
      #artist.add_song(self)
    end
    if genre != nil
      self.genre=genre
      #genre.add_song(self)
    end

  end
  def artist
    @artist
  end
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre
    @genre
  end
  def genre= (genre)
    @genre= genre
    genre.add_song(self)
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
  def self.create(name)
    created_song=self.new(name)
    created_song.save
    created_song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end


  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create(name)
    end
  end
  def self.new_from_filename(filename)
    array=filename.split(" - ")
    array[2]=array[2].gsub(/.mp3/,"")

    song=self.new(array[1])

    song.artist=Artist.find_or_create_by_name(array[0])
    song.genre=Genre.find_or_create_by_name(array[2])
    song
  end
  def self.create_from_filename(filename)
    song=self.new_from_filename(filename)
    song.save
  end

end
