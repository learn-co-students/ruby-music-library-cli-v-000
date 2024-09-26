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
    parts = filename.split(' - ')
      # 'Bob Dylan - Ballad of a Thin Man - folk.mp3' => typical file name
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].chomp(".mp3")

    artist_instance = Artist.find_or_create_by_name(artist_name)
    genre_instance = Genre.find_or_create_by_name(genre_name)

    self.new(song_name, artist_instance, genre_instance)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|song| song.save}
  end

end

# Chain:
# start from self.create_from_filename(filename)
#   filename =  'Bob Dylan - Ballad of a Thin Man - folk.mp3'
# calls self.new_from_filename(filename)
# calls self.find_or_create_by_name(title)
