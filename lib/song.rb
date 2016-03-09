require_relative '../lib/concerns/findable.rb'

class Song
  extend Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

 def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
  end

  def artist=(artist)
    artist.add_song(self) unless artist.songs.include?(self)
    @artist = artist
  end

  def genre=(genre)
    genre.add_song(self) unless genre.songs.include?(self)
    @genre = genre
  end

  def self.all
    @@all
  end


  def self.new_from_filename(file)
    filename_parts = parse(file)

    if find_by_name(filename_parts[1]).nil?
      name = filename_parts[1]
      artist = Artist.find_or_create_by_name(filename_parts[0])
      genre = Genre.find_or_create_by_name(filename_parts[2])
      self.new(name, artist, genre)
    end
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end

  def self.parse(file)
    file.gsub(/(\s-\s|\.mp3)/,'#').split(/#/)
  end



end