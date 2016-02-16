class Song
  attr_accessor :name,:artist,:genre
  
  @@all=[]

    def initialize(name,artist = nil,genre = nil)
      @name=name
      if artist
        self.artist = artist
      end
      if genre
          self.genre = genre
      end


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
      new_song = Song.new(name)
      new_song.save
      new_song
    end

    def artist=(artist)
      @artist = artist
      @artist.add_song(self)
      @artist.songs << self 
      
    end

    def genre=(genre)
      @genre = genre
      if genre.songs.detect{|i|i==self} == nil
        genre.songs << self
      end
    end

    def self.find_by_name(song)
      @@all.detect{|x| x.name == song}
    end

    def self.find_or_create_by_name(song)
      return self.find_by_name(song) unless nil
      self.create(song)
        
    end

    def self.new_from_filename(file)
     if Artist.all.detect{|artist| artist.name == file.split(' - ')[0] } != nil
      artist = Artist.all.detect{|artist| artist.name == file.split(' - ')[0] }
    else
     artist = Artist.create(file.split(' - ')[0])
    end
    if Genre.all.detect{|genre| genre.name == file.split(' - ')[2][0..-5] } != nil
      genre = Genre.all.detect{|genre| genre.name == file.split(' - ')[2][0..-5] }
    else
     genre = Genre.create(file.split(' - ')[2][0..-5])
   end
     self.new(file.split(' - ')[1],artist,genre)
    end

    def self.create_from_filename(file)
      new_song=new_from_filename(file)
      new_song.save
      new_song
      
    end

end