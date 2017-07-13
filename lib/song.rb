class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  @@all = []

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    file_array.each {|f|f.strip!}
    self.new(file_array[1]).tap do |song|
      song.artist = Artist.find_or_create_by_name(file_array[0])
      song.genre = Genre.find_or_create_by_name(file_array[2].split(".mp3").join)
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|f|f.save}
  end
end
