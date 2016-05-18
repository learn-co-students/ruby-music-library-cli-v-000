class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @all = []
  end

  def self.all
    @@all
  end

  def self.list_all
    self.all.each_with_index do |genre, i|
      puts "#{genre.name}"
    end
    return nil
  end

  def self.list_genre(my_genre)
    the_one = Genre.find_by_name(my_genre)
    the_one.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    return nil
  end

  def self.destroy_all
    @@all = []
  end

  def songs
    @all
  end

  def artists
    @all.collect{|song| song.artist }.uniq
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    return new_genre
  end

  def save
    @@all.push(self)
  end
end
