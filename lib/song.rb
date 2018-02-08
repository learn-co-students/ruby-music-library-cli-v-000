class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  def initialize(name, art = nil, gen = nil)
    @name = name
    art == nil ? @artist = art : self.artist=(art)
    gen == nil ? @genre = gen : self.genre=(gen)
  end
  def genre=(gen)
    @genre = gen
    gen.songs.tap {|g| g << self if !g.include?(self)}
  end
  def artist=(art)
    @artist = art
    @artist.add_song(self)
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
    self.new(name).tap {|new_song| new_song.save}
  end
  def self.find_by_name(f_name)
    self.all.map {|x| x if x.name == f_name}[0]
  end
  def self.find_or_create_by_name(f_name)
    self.find_by_name(f_name) == nil ? self.create(f_name) : self.find_by_name(f_name)
  end
  def self.new_from_filename(f_name)
    f_arr = f_name.scan(/([^-]+) - ([^-]+) - (.+).mp3/).flatten
    a = self.new(f_arr[1])
    a.artist = Artist.find_or_create_by_name(f_arr[0])
    a.genre = Genre.find_or_create_by_name(f_arr[2])
    a.tap {|a| a.save}
  end
  def self.create_from_filename(f_name)
    new_from_filename(f_name).tap {|x| x.save}
  end
end
