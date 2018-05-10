class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
    self.all
  end


  #song-genre
  #def songs
  #  @songs
  #end

  def add_song2(song)
    if @songs.include?(song)
    else
      @songs << song
    end
  end

  #def add_song(song)
  #  if @songs.include?(song)
  #  else
  #    @songs << song
  #  end
  #end

  #artist-genre
   def artists
     newarray=[]
     self.songs.each do |song|
       if newarray.include?(song.artist)
       else
         newarray << song.artist
       end
     end
     newarray
   end




end

#rspec spec/003_genre_basics_spec.rb
#rspec spec/005_songs_and_genres_spec.rb
#rspec spec/006_artists_and_genres_spec.rb
