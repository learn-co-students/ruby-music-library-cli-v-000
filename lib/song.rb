

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all=[]
  def initialize(name, artist=nil, genre=nil)
    @name=name
   
    if !artist.nil?
        @artist=artist
        artist.add_song(self)
    end
    if !genre.nil?
        @genre=genre
        genre.add_song(self)
      end
       @@all=self
  end
  
  def self.create(name)
    self.new(name).save
    self
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

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    if !genre.songs.include?(self)
      genre.add_song(self)
    end
  end

  def self.new_from_filename(file_name)
      arr=file_name.split(' - ')
      song=Song.new(arr[1])
      
      artist=Artist.new(arr[0])
     
      genre_arr=arr[2].split('.')
      genre=genre_arr[0]
      genre=Genre.new(genre)

      
      song.artist=artist
      song.genre=genre
      
      song
       
   end

end



# song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")
#      puts song.artist
#      puts song.genre








