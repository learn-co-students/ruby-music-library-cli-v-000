class Song

  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Nameable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name = nil, artist = nil, genre = nil)
    self.name = name
    self.artist= artist
    self.genre= genre
  end

  def self.all
    @@all
  end

  def artist= (name)
    @artist = name
    artist.add_song(self) unless self.artist == nil
  end

  def genre= (name)
    @genre = name
    genre.add_song(self) unless self.genre == nil
  end

  def self.filename_splitter(filename) #Checks for multiple filenames then splits them to remove the " - " and ".mp3"
    if filename.is_a? String
      new_filename = filename.split(' - ').tap do |filename|
        filename[2].chomp!(".mp3")
      end
    else
      filename.map! {|filename| filename.split(" - ")}
      filename.each {|filename| filename[2].chomp!(".mp3")}

    end
  end

  def self.new_from_filename(filename) #splits fieneames then checks for uniqueness, and creates a new Song based on the filename
    filename_info = self.filename_splitter(filename)

    Artist.all.detect {|artist| artist.name == filename_info[0]} == nil ? new_artist = Artist.new(filename_info[0]) : new_artist = Artist.all.detect {|artist| artist.name == filename_info[0]}

    Genre.all.detect {|genre| genre.name == filename_info[2]}  == nil ? new_genre = Genre.new(filename_info[2]) : new_genre = Genre.all.detect {|genre| genre.name == filename_info[2]}

    Song.new(filename_info[1]).tap do |o|
      o.artist = new_artist
      o.genre = new_genre
    end
  end

  def self.create_from_filename(filename) #same as new_from_filename, but checks for multiple filenames and saves songs using #create
    filename_info = self.filename_splitter(filename)
    if filename_info[0].is_a? String
      Artist.all.detect {|artist| artist.name == filename_info[0]} == nil ? new_artist = Artist.create(filename_info[0]) : new_artist = Artist.all.detect {|artist| artist.name == filename_info[0]}

      Genre.all.detect {|genre| genre.name == filename_info[2]}  == nil ? new_genre = Genre.create(filename_info[2]) : new_genre = Genre.all.detect {|genre| genre.name == filename_info[2]}

      Song.create(filename_info[1]).tap do |o|
        o.artist = new_artist
        o.genre = new_genre
      end
    else
      filename_info.collect do |filename|
        Artist.all.detect {|artist| artist.name == filename[0]} == nil ? new_artist = Artist.create(filename[0]) : new_artist = Artist.all.detect {|artist| artist.name == filename[0]}

        Genre.all.detect {|genre| genre.name == filename[2]}  == nil ? new_genre = Genre.create(filename[2]) : new_genre = Genre.all.detect {|genre| genre.name == filename[2]}

        Song.create(filename[1]).tap do |o|
          o.artist = new_artist
          o.genre = new_genre
        end
      end
    end
  end
end
