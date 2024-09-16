require 'pry'

class Song
    extend Concerns::Findable

  attr_accessor :name,:file_name
  attr_reader :artist, :genre #belongs to artist and genre

  @@all = []

  def initialize(name,artist = nil, genre = nil)
    @name = name
    #@artist = artist
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil

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

  def artist=(artist) # belongs to artist
    artist.add_song(self) unless artist.songs.include?(self)
    @artist = artist
  end

  def genre=(genre) #belongs to genre
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def artist
    @artist
  end

  def self.new_from_filename(file_name)
    data = file_name.split(" - ") #split the filename into an array
    name = data[1] # get song name from second element
    song = self.find_or_create_by_name(name) #instanciate a new song object
    artist_name = data[0] #set artist name equal to first element
    artist = Artist.find_or_create_by_name(artist_name) #instantiate a new artist object
    song.artist=(artist) #call artist_name= method and set artist name = name2
    song.artist.add_song(song) #add the song to the artist
    genre_data = data[2] # get data from third element
    genre_split = genre_data.split(".") #split genre into array to remove ".mp3"
    genre_name = genre_split[0] #get first element from genre array
    genre = Genre.find_or_create_by_name(genre_name) #instantiate a new genre object
    song.genre=(genre) #set the genre for the song
    song.genre.add_song(song) #add the song to the genre
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def self.list_song_names
    sorted_array = self.all.sort_by! {|s| s.name}
    sorted_array.each_with_index do |item, index|
    number = index + 1 # add 1 to the array index for each name
    puts "#{number}. #{item.artist.name} - #{item.name} - #{item.genre.name}" #print the number and name
    end
  end

  def self.list_by_artist(artist_name)
    artist_array = self.all.select{|song| song.artist.name == artist_name}
    sorted_array = artist_array.sort_by! {|s| s.name}
    sorted_array.each_with_index do |item, index|
    number = index + 1 # add 1 to the array index for each name
    puts "#{number}. #{item.name} - #{item.genre.name}" #print the number and name
    end
  end

  def self.list_by_genre(genre_name)
    genre_array = self.all.select{|song| song.genre.name == genre_name}
    sorted_array = genre_array.sort_by! {|s| s.name}
    sorted_array.each_with_index do |item, index|
    number = index + 1 # add 1 to the array index for each name
    puts "#{number}. #{item.artist.name} - #{item.name}" #print the number and name
    end
  end

  def self.select_by_number(number)
    sorted_array = self.all.sort_by! {|s| s.name}
    max_length = sorted_array.length
    index_number = number - 1 # convert user input to index number
    if number.between?(1, max_length) ###here is the problem!!
      selected_song = sorted_array[index_number]
      puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
    end
  end

  end
