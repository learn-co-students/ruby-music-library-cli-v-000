class Genre
extend Concerns::Findable
attr_accessor :name, :songs, :artists

@@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end



  def artists
    
    unique_artists = []
    all_artists = @songs.collect do |song|
     song.artist
    end
    all_artists.each do |artist|
     if !unique_artists.include?(artist)
      unique_artists << artist
    end
  end
       unique_artists
  end


  def self.all 
    @@all 
  end

  def self.destroy_all
    @@all.clear
  end

end





































