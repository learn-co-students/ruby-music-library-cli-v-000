class Song
@@all = []
attr_accessor :name
  def initialize(name, artist=(nil), genre=(nil))
    self.name = name
    if artist.is_a?(Artist)
      self.artist = artist
    end
    if genre.is_a?(Genre)
      self.genre = genre
    end
  end
  def self.new_from_filename(filename) #filename is artist,name,genre whereas init is name,artist,genre
    array = filename.split(" - ")
    array[2] = array[2].chomp(".mp3")
    array[0] = Artist.find_or_create_by_name(array[0])
    array[2] = Genre.find_or_create_by_name(array[2])
    newsong = Song.new(array[1], array[0], array[2])
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap do |song|
      song.save
    end
  end

  def genre
    @genre
  end
  def genre=(name)
    @genre = name
    #name.songs << self unless name.songs.include?(self)
    if !name.songs.include?(self)
      name.songs << self
    end
  end

  def self.find_by_name(search)
    @@all.find do |song|
      song.name == search
    end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create(name)
    else find_by_name(name)
    end
  end


  def artist
    @artist
  end

  def artist=(name)
    @artist = name
    name.add_song(self)

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
    self.new(name).tap do |name|
      name.save
    end
  end







end
