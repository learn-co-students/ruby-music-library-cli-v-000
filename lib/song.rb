class Song

  extend Concerns::Findable

  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist= artist
    self.genre= genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new_song = Song.new(name, artist, genre).tap do |song|
      song.save
    end
  end

  def artist= (name)
    @artist = name
    artist.add_song(self) unless self.artist == nil
  end

  def genre= (name)
    @genre = name
    genre.add_song(self) unless self.genre == nil
  end

  def self.filename_splitter(filename)
    # binding.pry
    if filename.is_a? String
      new_filename = filename.split(' - ').tap do |filename|
        filename[2].chomp!(".mp3")
      end
    else
      filename.map! {|filename| filename.split(" - ")}
      filename.each {|filename| filename[2].chomp!(".mp3")}
      
    end
  end

  def self.new_from_filename(filename)
    filename_info = self.filename_splitter(filename)

    if Artist.all.detect {|artist| artist.name == filename_info[0]} == nil
      new_artist = Artist.new(filename_info[0])
    else
      new_artist = Artist.all.detect {|artist| artist.name == filename_info[0]}
    end

    if Genre.all.detect {|genre| genre.name == filename_info[2]}  == nil
      new_genre = Genre.new(filename_info[2])
    else
      new_genre = Genre.all.detect {|genre| genre.name == filename_info[2]}
    end

    new_song = Song.new(filename_info[1], new_artist, new_genre)

    new_song
  end

  def self.create_from_filename(filename)
    filename_info = self.filename_splitter(filename)
    # binding.pry
    if filename_info[0].is_a? String
      if Artist.all.detect {|artist| artist.name == filename_info[0]} == nil
        new_artist = Artist.create(filename_info[0])
      else
        new_artist = Artist.all.detect {|artist| artist.name == filename_info[0]}
      end

      if Genre.all.detect {|genre| genre.name == filename_info[2]}  == nil
        new_genre = Genre.create(filename_info[2])
      else
        new_genre = Genre.all.detect {|genre| genre.name == filename_info[2]}
      end

      new_song = Song.create(filename_info[1], new_artist, new_genre)
      new_song
    else
      filename_info.collect do |filename|
        if Artist.all.detect {|artist| artist.name == filename[0]} == nil
          new_artist = Artist.create(filename[0])
        else
          new_artist = Artist.all.detect {|artist| artist.name == filename[0]}
        end

        if Genre.all.detect {|genre| genre.name == filename[2]}  == nil
          new_genre = Genre.create(filename[2])
        else
          new_genre = Genre.all.detect {|genre| genre.name == filename[2]}
        end

        new_song = Song.create(filename[1], new_artist, new_genre)
        new_song
        # binding.pry
      end
    end
  end
end
