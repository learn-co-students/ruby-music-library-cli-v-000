class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def self.all 
    @@all 
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Song.all << self
  end 

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    song_info_array = filename.split(/ - |\.mp3/)
    Song.new(song_info_array[1],Artist.find_or_create_by_name(song_info_array[0]),Genre.find_or_create_by_name(song_info_array[2]))
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save if !@@all.include?(song)
    song

  end

  def print
     puts self.artist.name + ' - ' + self.name + ' - ' + self.genre.name
   end
 
   def self.print_all
     self.all.each_with_index do |info, i| 
       print "#{i+1}. " 
       info.print
     end
   end



end 