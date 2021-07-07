class Song

  @@all = []

  attr_accessor :name, :file_name, :alph_sort_int
  attr_reader :artist, :genre

  def initialize(name, *artist_genre)
    @name = name
    self.artist = artist_genre[0] if artist_genre[0]
    self.genre = artist_genre[1] if artist_genre[1]
  end

  def self.make_int_alph_list
    array_of_song_names = self.all.collect {|s| s.name}.sort
    alphabetized_list_of_song_obj = array_of_song_names.collect {|s| Song.find_by_name(s)}
    alphabetized_list_of_song_obj.each_with_index{|s, i| s.alph_sort_int = i + 1}
  end

  def artist=(artist_obj)
    @artist = artist_obj
    artist_obj.add_song(self)
  end

  def genre=(genre_obj)
    @genre = genre_obj
    genre_obj.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

# Takes one file_name!
# Makes a full song object with artist and genre.

  def self.new_from_filename(file_name)
    artist_name, song_name, genre_name = file_name.gsub(".mp3", "").split(" - ")

    song = self.new(song_name).tap do |song_obj|
      song_obj.artist = Artist.find_or_create_by_name(artist_name)
      song_obj.genre = Genre.find_or_create_by_name(genre_name)
      song_obj.file_name = file_name.gsub(".mp3", "")
    end
  end

#________________________________________________


  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).tap {|x| x.save}

  end


  #----------FIND------------
  extend Concerns::Findable

  def self.find_by_int(int)
    self.all.find{|s| s.alph_sort_int == int}
  end

end
