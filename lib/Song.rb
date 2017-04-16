require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    artist.add_song(self) unless artist == nil #unless를 안붙이면 오류가 났던 이유 = nil classㅇㅔ는 add_song 메소드가 없으니까
    @genre = genre
    genre.songs << self unless genre == nil

  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song #ㅇ이걸 왜 해야 하지
    #binding.pry
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def artist=(artist)
    if @artist == nil
      @artist = artist
      @artist.songs << self
      @artist.add_song(self)
    end #여기서 self를 쓰면 무한루프를 돌아.
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)? self.find_by_name(name) : self.create(name)
  end
end
