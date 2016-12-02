class Song

  attr_accessor :name
  attr_reader :artist, :genre
#  @@all = []

  # extend NewModules::ClassMethods
  # include NewModules::InstanceMethods

  @@all=[]

  def initialize(name, artist=nil, genre=nil)
    #self.class.destroy_all
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
    #@artist = artist if artist != nil
    # if artist != nil
    #   @artist = artist
    #   artist.songs << self
    # end
    #artist.songs(self) if artist != nil
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    unless genre.songs.include?(self)
      genre.songs << self
    end
    #genre.add_song(self)
  end

  def self.find_by_name(name)
    found = nil
    self.all.each do |song|
      if song.name == name
        found = song
      end
    end
    found
  end

  def self.find_or_create_by_name(name)
    search_result = self.find_by_name(name)
    if search_result == nil
      create(name)
    else
      search_result
    end
  end

  def self.new_from_filename(filename)
    split_file = filename.split(" - ")
    unless @@all.include?(self.find_by_name(split_file[1]))
      # new_song = self.find_or_create_by_name(split_file[1])
      # new_song.artist = Artist.find_or_create_by_name(split_file[0])
      # new_song.genre = Genre.find_or_create_by_name(split_file[2].split(".")[0])
      new_song = self.new(split_file[1])
      new_song.artist = Artist.find_or_create_by_name(split_file[0])
      new_song.genre = Genre.find_or_create_by_name(split_file[2].split(".")[0])
    end
    new_song
  end

  def self.create_from_filename(filename)
    #binding.pry
    #new_file = self.new_from_filename(filename)
    split_file = filename.split(" - ")
    #binding.pry
    unless @@all.include?(self.find_by_name(split_file[1]))
      new_file = self.new_from_filename(filename)
      new_file.save
      #binding.pry
  #    new_create = self.new_from_filename(filename)
    end
    new_file
  #  binding.pry
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    created = self.new(name)
    created.save
    created
    #binding.pry
  end

  def save
    self.class.all << self
  end

end
