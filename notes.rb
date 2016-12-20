#remembering objects

class Song

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all.each do |song|
            puts song.name
        end
    end
end

#advanced class methods

class Person
  attr_accessor :name
  @@people = []

  def self.all
    @@people
  end

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.find_by_name(name)
    self.all.detect{|person| person.name == name}
  end
end

class Person
  attr_accessor :name
  @@all = []
  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def normalize_name
    self.name.split(" ").collect{|w| w.capitalize}.join(" ")
  end

  def self.normalize_names
    self.all.each do |person|
      person.name = person.normalize_name
    end
  end
end

class Person
  attr_accessor :name
  @@all = []
  def self.all
    @@all
  end

  def self.create(name)
    person = self.new
    person.name = name
    @@all << person
  end

  def self.print_all
    self.all.each{|person| puts "#{person.name}"}
  end
end

Person.create("Ada Lovelace")
Person.create("Grace Hopper")

Person.print_all

#intro to object relationships / belongs to

class Artist
  attr_accessor :name, :genre

  def initialize(name, genre) 
    @name = name
    @genre = genre
  end

end

drake = Artist.new("Drake", "rap")
hotline_bling = Song.new("Hotline Bling")

hotline_bling.artist = drake

#has many object

class Artist

    attr_accessor :name

    def initialize(name)
      @name = name
      @songs = []
    end

    def add_song(song)
        @songs << song
        song.artist = self
    end

    def songs
        @@songs 
    end
end

    def add_song_by_name(name, genre)
        song = Song.new(name, genre)
        @songs << song
        song.artist = self
    end

    def artist_name
        self.artist.name
    end

#collaborating objects

class Song
  attr_accessor :title

  def self.new_by_filename(filename)
    self.title = filename.splt(" - ")[1]
  end

end

class Mp3Importer
  attr_accessor :songs 
  def import(list_of_filenames)
    list_of_filenames.each{|file_name| songs << Song.new_by_filename(file_name)}
  end
end


class Song
  attr_accessor :artist

  # other methods

  def artist_name=(name)
    if (self.artist.nil?)
      self.artist = Artist.new(name)
    else
      self.artist.name = name
    end
  end
end

class Artist
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # other methods 

end

#has many objects through

class Song
  attr_accessor :name, :artist, :genre 
end

class Genre
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Song
  attr_accessor :name, :artist, :genre

  def initialize(name, genre)
    @name = name
    @genre = genre
  end
end

class Artist
  attr_accessor :name

  def initialize(name)
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end
  end
end

class Genre
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end
end



