class Song
  attr_accessor :name, :artist
  @@all = []

    def initialize(name, artist = nil)
      @name = name
      @artist = artist
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

    # def self.new_by_filename(filename)
    #   file_data = filename.split(" - ")
    #   song = Song.new(file_data[1])
    #   song.artist_name = file_data[0]
    #   song
    # end

    def artist=(name)
      # new_artist = Artist.new(name)
      # self.artist = new_artist
      # artist.add_song(self)
    end


end
