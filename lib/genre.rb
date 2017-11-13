class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    self.new(name).tap {|s| s.save}
  end

  def songs
    @songs
  end

  def add_song(song) #has many songs interface
    @songs << song
    song.genre = self unless song.genre == self
  end

  def artists # has many artists through songs
    self.songs.collect {|s| s.artist}.uniq
  end

  def self.list_genre_names
    sorted_array = self.all.sort_by! {|s| s.name}
    sorted_array.each_with_index do |item, index|
    number = index + 1 # add 1 to the array index for each name
    puts "#{number}. #{item.name}" #print the number and name
    end
  end

end
