require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist =nil, genre = nil)
    @name = name
    @artist = artist
    @genre =genre
    if artist
      if !Artist.all.include?(artist)
        Artist.new(artist)
      end
      artist.add_song(self)
    end
    if genre
      if !Genre.all.include?(genre)
        Genre.new(genre)
      end
      genre.add_song(self)
    end
    self
  end

  def self.all
    @@all
  end

  def save
    @@all  << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil)
    new_song =self.new(name,artist)
    new_song.save
    new_song
  end

  def artist=(artist)
    if !@artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre =genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    artist_name, name, genre_name = filename.split(".")[0].split(" - ")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

end


class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs =[]
  end

  def self.all
    @@all
  end

  def save
    @@all  << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new =self.new(name)
    new.save
    new
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
      song.artist = self
    end
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end

end

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all  << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil)
    new =self.new(name)
    new.save
    new
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end
end

class MusicImporter
  attr_accessor :path


  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(self.path).select {|f| f.match(/mp3$/)}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

  def list_songs
    list = self.files.sort
    i = 0
    while i < list.size
      puts "#{i+1}. #{list[i].split('.')[0]}"
      i += 1
    end
   end


end

class MusicLibraryController


  def initialize (path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
    @music_importer
  end

  def call
    #puts "Welome to Music Library Controller. Please enter what you want to perform: "
    input = gets.chomp
    sorted_list = Song.all.sort {|x,y| x.artist.name <=> y.artist.name}
    case input
      when "list songs"
      sorted_list.each_with_index {|song,i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      #puts "please enter exit"
      gets.chomp

      when "list artists"
      Artist.all.each {|artist| puts artist.name}
      #puts "please enter exit"
      gets.chomp

      when "list genres"
      Genre.all.each {|genre| puts genre.name}
      #puts "please enter exit"
      gets.chomp

      when "play song"
      # puts "which song?"
      input2 =  gets.chomp.to_i
      item = sorted_list[input2 - 1]
      puts "Playing #{item.artist.name} - #{item.name} - #{item.genre.name}"
      #puts "please enter exit"
      gets.chomp

      when "list artist"
      #puts "which artist?"
      input2 = gets.chomp.to_s
      songs = Artist.find_by_name(input2).songs
      songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      #puts "please enter exit"
      gets.chomp

      when "list genre"
      #puts "which genre"
      input2 = gets.chomp.to_s
      songs = Genre.find_by_name(input2).songs
      songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      #puts "please enter exit"
      gets.chomp
    end

   
  end


end








#Song.create("In an Aeroplane Over the Sea")
#Song.all


#song_1 = Song.find_or_create_by_name("In an Aeroplane Over the Sea")
#song_2 = Song.find_or_create_by_name("In an Aeroplane Over the Sea")
#binding.pry
