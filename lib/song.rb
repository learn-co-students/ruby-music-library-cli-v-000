class Song
attr_accessor :name, :artist, :genre

@@all = []


def initialize(name, artist = nil, genre = nil)

     @name = name
     @artist = artist
     @genre = genre

     if @artist == nil
       nil
     else
       self.artist=(artist)
     end
     if @genre == nil
      nil
     else
       self.genre = genre
     end

  end

def self.all
  @@all
end

def self.destroy_all
  all.clear

end

def self.find_by_name(name)
  all.detect{ |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end


def save
  @@all << self
end

def self.create(name)
  new_song = Song.new(name)
  new_song.save
  new_song
end

def artist=(artist)
     @artist = artist
     artist.add_song(self)
   end

   def genre=(genre)
       @genre = genre
        genre.add_song(self)
      end


      def self.new_from_filename(filename)
        song_parts = filename.split(" - ")
        artist_name, song_name, genre_name = song_parts[0], song_parts[1], song_parts[2].gsub(".mp3", "")
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        new(song_name, artist, genre)

  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{|s|s.save}
   end
 


end
