class Song
  attr_accessor :name, :artist, :genre
  @@all=[]

  def initialize(name, artist=nil, genre=nil)
    @name=name
    @artist=artist
    @genre=genre
    if artist != nil
      self.artist=artist
      end
    if genre != nil
     self.genre=genre
   end

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
   @genre=genre
    genre.add_song(self) unless genre.songs.detect {|song| song==self}
  end

  def self.find_by_name(name)
    all.detect {|song| song.name==name}
  end

  def self.find_or_create_by_name(name)
       if song= self.find_by_name(name)
         song
      else
       self.create(name)
     end
   end

   def self.new_from_filename(filename)
     file_artist=filename.split(" - ")[0]
     file_song= filename.split(" - ")[1]
     file_genre=filename.split(" - ")[2].gsub(".mp3","")

     song=Song.find_or_create_by_name(file_song)
     song.artist=(Artist.find_or_create_by_name(file_artist))
     song.genre=(Genre.find_or_create_by_name(file_genre))
     song
     end

     def self.create_from_filename(filename)
       song=self.new_from_filename(filename).save


     end

  end
