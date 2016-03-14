class Song
  #include Concerns::Findable
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
    if genre != nil
      @genre = genre
      genre.add_song(self)
    end
  end

  def self.all
    @@all
  end

  def print
    puts "#{@artist.name} - #{@name} - #{@genre.name}"
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self 
  end

  def self.create(song_name)
    Song.new(song_name).save
  end

  def self.new_from_filename(filename)
    filename.chomp! ".mp3"
    attributes = filename.split(" - ")
    attributes.each { |category| category.strip! } 
    new_artist = Artist.find_or_create_by_name(attributes[0])
    new_genre = Genre.find_or_create_by_name(attributes[2])
    name = attributes[1]
    Song.new(name, new_artist, new_genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 
end
