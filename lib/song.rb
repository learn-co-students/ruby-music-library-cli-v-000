class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def name=(name)
    @name = name
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
    created = self.new(name).tap {|o| o.save}   # more condensed foobar.tap(&:save)
  end

  def artist=(artist_name)
    @artist = Artist.find_or_create_by_name(artist_name).name
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = Genre.find_or_create_by_name(genre)
    self.genre.songs << self unless self.genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}   # used song.name = name. so reset name instead of checking conditional ;_;
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.chomp!(".mp3").split(" - ")
    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
