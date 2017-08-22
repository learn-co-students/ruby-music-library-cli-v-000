

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
     #establishes "has many genres through songs" relationship
  end

  # def add_song(song_name)
  #   Song.new(song_name, self).tap do |new_song|
  #     self.songs << new_song
  #   end
  # end

  def add_song(song)
    if !song.artist
      song.artist = self
      self.songs << song
    end
  end

  def exists?
    self.class.all.detect {|artist| artist == self} ? true : false
  end

  def has_song?(checked_song)
    self.songs.detect {|song| song == checked_song} ? true : false
  end

  def has_genre?(checked_genre)
    self.genres.detect {|genre| genre == checked_genre} ? true : false
  end

  def genres #establishes "has many genres through songs" relationship
    genres_array = []
    self.songs.each do |song|
      if !!song.genre
        genres_array << song.genre
      end
    end
    # binding.pry
    genres_array.uniq
  end


  # def genres #establishes "has many genres through songs" relationship
  #   self.songs.collect.uniq do |song|
  #     song.genre
  #   end
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap do |new_artist|
      new_artist.save
    end
  end

end
