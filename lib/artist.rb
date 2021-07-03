#rspec spec/001_song_basics_spec.rb
class Artist

  extend Concerns::Findable

attr_reader :songs
attr_accessor :name

  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
    #@@all<<self
  end

  def self.all
    @@all
  end


  def self.destroy_all
    self.all.clear
  end

  def save
    @@all<<self
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end
  #def self.create(name)
    #@@all<<name
    #name
  #end

  def add_song(song)
    song.artist=self unless song.artist
    songs<<song unless songs.include?(song)
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end
  #def genres
    #songs.map do |song|
      #song.genre
    #end
  #end
#rspec spec/004_songs_and_artists_spec.rb
end
