class Song
    extend Concerns::Findable
    attr_accessor :name
    # .name=   .name
    attr_reader :artist, :genre

    @@all = []

    # Song.new(name)
    def initialize(name, artist=nil, genre=nil)
      @name = name
      self.artist = artist unless artist == nil
      self.genre = genre unless genre == nil
    end

    def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
    end

    def self.new_from_filename(filename)
      file = filename.split(" - ")
      song = self.new(file[1])
      song.artist = Artist.find_or_create_by_name(file[0])
      song.genre = Genre.find_or_create_by_name(file[2].gsub(".mp3", ""))
      song
    end

    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
      song
    end


    def save
      @@all << self
    end

    def self.create(name)
      self.new(name).tap{|s| s.save}
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end
end
