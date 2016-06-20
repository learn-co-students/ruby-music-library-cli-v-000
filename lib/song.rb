require 'pry'
class Song
extend Concerns::Findable

  attr_accessor :name, :artist, :all, :genre #,:genres, :artists,
  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
#       @artist = artist
#       @genre = genre
       self.artist = artist if artist  #Songs and Artists initializing a song with an artist new songs accept an optional argument for the artist
       self.genre = genre if genre #This line makes no impact
      #save
    end

    def self.all
      @@all
    end

    def artist=(artist)
        @artist = artist
        artist.songs << self unless artist.songs.include?(self)
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre # necessary
        #genre.song = self Not necessary
        genre.songs << self unless genre.songs.include?(self) #This line a must.
        genre.add_song(self)
    end

    def add_song(song)
      @song = song
      genre.songs << self unless genre.songs.include?(self)
      artist.songs << self unless artist.songs.include?(self)
      @songs << song unless @songs.include?(song)
    end


    def save  #instance method; not for module
        @@all << self
    end

    def Song.create(name, artist = nil, genre = nil)
        # new(name, artist = nil, genre = nil).tap {|song| song.save} unless self.all.include?(name)
    #  binding.pry #
      song = self.new(name)
      @@all << song
      song
    end


    def self.new_from_filename(filename)
   # binding.pry
      data =  filename.gsub('.mp3','').split(" - ")  #gsub must be before split
      song = self.new(data[1])
      song.artist = Artist.find_or_create_by_name(data[0])
      song.genre = Genre.find_or_create_by_name(data[2])
      song
    end

#   def self.create_from_filename(filename)
#    # binding.pry
#       data =  filename.gsub('.mp3','').split(" - ")  #gsub must be before split
#       @artist = Artist.find_or_create_by_name(data[0])
#       @genre = Genre.find_or_create_by_name(data[2])
# #       name = ()
#       self.new(data[1], @artist, @genre)
#     end
      def self.create_from_filename(filename)
        # Song.new_from_filename(filename).tap{|song| song.save}
        array = filename.chomp(".mp3").split(/\s[-]\s/)
        song = self.new(array[1])
        song.artist = Artist.find_or_create_by_name(array[0])
        song.genre = Genre.find_or_create_by_name(array[2])
        song.save
        song
      end



  def to_s   #WHAT IS THIS? AND WHY IS THIS NECESSARY?
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

    def self.destroy_all
        @@all.clear #@@all = []
    end

end
