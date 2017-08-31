class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  extend Nameable::ClassMethods

  attr_accessor :name

  @@all = []

  def initialize(name, singer = nil, genre = nil)
    @name = name
    self.artist=(singer) if singer #must be self and not @, calling method here
    self.genre=(genre) if genre #must be self and not @, calling method here
  end

  def artist #same as attr_reader :artist
    @artist
  end

  def artist=(singer) #Constructor writer
    @artist = singer  #has to be @ and not self.
    @artist.add_song(self) #instance method in Artist class
  end

  def genre #simple attr :genre
    @genre
  end

  def genre=(genre)  #Constructor writer
    @genre = genre
    @genre.add_song(self) #add_song an instance method in Genre class
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    array = filename.split(' - ')
      # 'Bob Dylan - Ballad of a Thin Man - folk.mp3' => typical file name
    singer = array[0]
    title = array[1]
    type = array[2].chomp(".mp3")

    #tap it up when you get the chance
    song = self.find_or_create_by_name(title)
    song.artist = Artist.find_or_create_by_name(singer)
    song.genre= Genre.find_or_create_by_name(type)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end

# Chain:
# start from self.create_from_filename(filename)
#   filename =  'Bob Dylan - Ballad of a Thin Man - folk.mp3'
# calls self.new_from_filename(filename)
# calls self.find_or_create_by_name(title)
