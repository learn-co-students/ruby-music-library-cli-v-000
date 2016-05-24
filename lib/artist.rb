class Artist

extend Concerns::Findable
attr_accessor :name, :songs, :genres

@@all = []


  def initialize(name)
    @name = name
    @songs = []
    
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
   if @songs.include?(song) == nil
     @songs << song
   end
   if song.artist == nil
     song.artist = self
   end
  end
  
  def genres
      unique_genres = []
      genres_array = self.songs.collect {|song|song.genre}
      genres_array.each do |genre| 
        if !unique_genres.include?(genre)
          unique_genres << genre
        end
      end
        unique_genres

    end





  def self.all 
    @@all 
  end

  def self.destroy_all
    @@all.clear
  end

end
































