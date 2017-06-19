class Song
  extend Concerns::Findable

  attr_reader :artist, :genre

  attr_accessor :name

  def save
    self.class.all << self    
  end

  @@all = []

  def self.create(name)
    self.new(name).tap{|data| data.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end



  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    file_song = file.split(" - ")[1]
    file_artist = file.split(" - ")[0]
    file_genre = file.split(" - ")[2][0..-5]
    self.new(file_song).tap do |newsong|
      newsong.artist = Artist.find_or_create_by_name(file_artist)
      newsong.genre = Genre.find_or_create_by_name(file_genre)
    end
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).tap{|f| f.save}
  end

end