class Song
  extend  Concerns::Creatable, Concerns::Findable
  include Concerns::Saveable

  @@all = []
  attr_accessor :name
  attr_reader   :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre  = genre  if genre  != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def print
    puts "#{@artist.name} - #{@name} - #{@genre.name}"
  end

  def self.all
    @@all
  end

  def self.create_from_filename(file)
    song = new_from_filename(file)
    song.save
    song
  end

  def self.list_all
    all.each_with_index { |song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  # file format --> artist - song - genre.file_type E.g. "Action Bronson - Larry Csonka - indie.mp3"
  def self.new_from_filename(file)
    filename_parts = file.split(/ - /)
    genre_name =  filename_parts[2].split('.')[0]
    song = Song.new(filename_parts[1], Artist.find_or_create_by_name(filename_parts[0]), Genre.find_or_create_by_name(genre_name))
    @@all << song
    song.artist.add_song(song)
    song
  end

  def self.play(song_number)
    puts "Playing #{all[song_number-1].artist.name} - #{all[song_number-1].name} - #{all[song_number-1].genre.name}" if song_number.between?(1,all.size)
  end
end
