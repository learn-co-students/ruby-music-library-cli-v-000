
class MusicLibraryController

  attr_reader :importer#, :array_of_int_of_songs

  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call

    input = ""

    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip

      case input

      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      when "exit"
        break
      else
        puts "Please make a selection from the list."
      end
    end
  end

  def list_songs
    # array_of_song_names = Song.all.collect {|s| s.name}.sort
    # alphabetized_list_of_song_obj = array_of_song_names.collect {|s| Song.find_by_name(s)}
    # alphabetized_list_of_song_obj.each_with_index{|s, i| s.alph_sort_int = i + 1}
    alphabetized_list_of_filenames = Song.make_int_alph_list.collect {|x| x.file_name}
    alphabetized_list_of_filenames.each_with_index {|f, i| puts "#{i + 1}. #{f}"}
  end

  def list_artists
    array_of_artist_names = Artist.all.collect {|a| a.name}.sort
    #alphabetized_list_of_artist_obj = array_of_artist_names.collect {|a| Artist.find_by_name(a)}
    #alphabetized_list_of_artists = alphabetized_list_of_artist_obj.collect {|x| x.name}
    #alphabetized_list_of_artists.each_with_index {|a, i| puts "#{i + 1}. #{a}"}
    array_of_artist_names.each_with_index {|a, i| puts "#{i + 1}. #{a}"}
  end

  def list_genres
    array_of_genres = Genre.all.collect {|g| g.name}.sort
    array_of_genres.each_with_index {|g, i| puts "#{i+1}. #{g}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if Artist.find_by_name(input)
      artists_list_of_song_names = Artist.find_by_name(input).songs.collect {|s| s.name}.sort
      list_of_obj = artists_list_of_song_names.collect {|s| Song.find_by_name(s)}
      filenames_by_artist = list_of_obj.collect {|s| s.file_name.gsub("#{input} - ", "")}
      filenames_by_artist.each_with_index {|s, i| puts "#{i + 1}. #{s}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if Genre.find_by_name(input)
      genres_list_of_song_names = Genre.find_by_name(input).songs.collect {|s| s.name}.sort
      alph_list_of_obj = genres_list_of_song_names.collect {|s| Song.find_by_name(s)}
      filenames_by_genre = alph_list_of_obj.collect {|s| s.file_name.gsub(" - #{input}", "")}
      filenames_by_genre.each_with_index {|s, i| puts "#{i + 1}. #{s}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    Song.make_int_alph_list

    input = gets.strip.to_i
    if Song.all.collect {|s| s.alph_sort_int}.include?(input)
      playing_now_obj = Song.find_by_int(input)
      puts "Playing #{playing_now_obj.name} by #{playing_now_obj.artist.name}"
    end
  end

end
