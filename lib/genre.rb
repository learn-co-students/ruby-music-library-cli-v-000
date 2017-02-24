class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all= []

  def initialize(name)
    @name = name
    @songs= []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre= self unless song.genre == self
  end

<<<<<<< HEAD
  def self.all
    @@all
  end

=======
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13
  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

<<<<<<< HEAD
  def self.create(name)
    genre = Genre.new(name)
    genre.save
=======
  def self.create(genre)
    genre = Genre.new(genre)
    @@all << genre
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13
    genre
  end

  def artists
<<<<<<< HEAD
    self.songs.collect do |song|
      song.artist
    end.uniq
=======
    self.songs.collect {|s| s.artist}.uniq
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13
  end

  def to_s
    self.name
  end
end
