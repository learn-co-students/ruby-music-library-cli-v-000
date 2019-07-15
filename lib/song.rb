class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize (name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(song)
    song = Song.new(song)
    song.save
    song
  end

  def self.create_by_name(name)
      song = self.new(name)
      song.name = name
      #binding.pry
      @@all << song
      song
    end

     def self.find_by_name(name)
      @@all.detect{|song| song.name == name}
      #binding.pry
    end

     def self.find_or_create_by_name(name)
      if self.find_by_name(name) != nil
        self.find_by_name(name)
      else
        self.create(name)
      end
    end

    def self.new_from_filename(filename)
     split_file = filename.gsub(".mp3", "").split(" - ")
     artist = Artist.find_or_create_by_name(split_file[0])
     genre = Genre.find_or_create_by_name(split_file[2])
     self.new(split_file[1], artist, genre)
   end

    def self.create_from_filename(filename)
     song = self.new_from_filename(filename)
     song.save
   end


end
