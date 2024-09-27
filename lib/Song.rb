

class Song
  attr_accessor :name
  attr_reader :genre, :artist

  @@all = []

    def initialize(name, art_obj = nil, gen_obj = nil)
        @name = name
        self.artist = art_obj
        self.genre = gen_obj
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
      song = self.new(name)
      song.save
      song
    end

    def artist=(art_obj)
      if art_obj != nil
        art_obj.add_song(self)
        @artist = art_obj
      else
        @artist = art_obj
      end
    end

    def genre=(gen_obj)
      if gen_obj != nil
        gen_obj.songs << self unless gen_obj.songs.include?(self)
        @genre = gen_obj
      else
        @genre = gen_obj
      end
    end

    def self.find_by_name(name)
      self.all.detect{|s| s.name == name}
    end

    def self.find_or_create_by_name(name)
      if !self.find_by_name(name)
        self.create(name)
      else
        self.find_by_name(name)
      end
    end

    def self.new_from_filename(filename)
      song_arr = filename.split(" - ")
      song = self.find_or_create_by_name("#{song_arr[1]}")
      artist = Artist.find_or_create_by_name("#{song_arr[0]}")
      genre = Genre.find_or_create_by_name("#{song_arr[2].chomp(".mp3")}")
      song.artist = artist
      song.genre = genre
      song
    end

    def self.create_from_filename(name)
      song = new_from_filename(name)
      song.save
      song

    end

end # => End Song Class
