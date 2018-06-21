require 'pry'
class MusicLibraryController
  @@song_list = []

  def initialize(file_path = "./db/mp3s")
    new_music = MusicImporter.new(file_path)
    new_music.import
    @song_list = []
  end

  def call
    puts "Welcome to your music library!"
    answer = ""
    options = ["list songs" , "list artists", "list genres" , "list artist" , "list genre" , "play song" , "exit"]

    while !options.include?(answer) do
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      answer = gets
    end



    self.list_songs if answer == "list songs"
    self.list_artists if answer == "list artists"
    self.list_genres if answer == "list genres"
    self.list_songs_by_artist if answer == "list artist"
    self.list_songs_by_genre if answer == "list genre"
    self.play_song if answer == "play song"

  end

  def play_song
    puts "Which song number would you like to play?"
    answer = gets
    answer_adj = answer.to_i
    answer_adj -= 1
    if answer_adj >= 0
      alpha_song_list = []
      self.update_song_list
      #sort songs alphabetically
      @song_list.sort_by! {|obj| obj.name}
      #puts each song with a number in front of it
      #binding.pry
      @song_list.each do |song|
        alpha_song_list << "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end

      if answer_adj < alpha_song_list.length
        chosen_song = alpha_song_list[answer_adj].split(" - ")
        #{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        puts "Playing #{chosen_song[1]} by #{chosen_song[0]}"
      end
    end

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    answer = gets
    if Genre.find_by_name(answer)
      chosen_genre = Genre.find_by_name(answer)
      self.update_song_list
      song_list = []
      @song_list.each do |song_obj|
        song_list << song_obj if song_obj.genre.name == answer
      end
      counter = 1

      song_list.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets
    if Artist.find_by_name(answer)
      chosen_artist = Artist.find_by_name(answer)
      #chosen_artist.songs

      self.update_song_list
      @song_list.sort_by! {|obj| obj.name}
      song_list = []
      @song_list.each do |song_obj|
        song_list << song_obj if song_obj.artist.name == answer
      end
      #puts each song with a number in front of it
      counter = 1
      #binding.pry
      song_list.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end

  def list_artists
    artist_list = Artist.all.sort_by! {|obj| obj.name}
    counter = 1
    artist_list.each do |artist_name|
      puts "#{counter}. #{artist_name.name}"
      counter += 1
    end
  end

  def list_genres
    genre_list = Genre.all.sort_by! {|obj| obj.name}
    counter = 1
    genre_list.each do |genre_name|
      puts "#{counter}. #{genre_name.name}"
      counter += 1
    end
  end

  def update_song_list
    Song.all.each do |song_object|
      if !@@song_list.include?(song_object)
        @@song_list << song_object
        @song_list << song_object
      end
    end
  end

  def list_songs
    self.update_song_list
    #sort songs alphabetically
    @song_list.sort_by! {|obj| obj.name}
    #puts each song with a number in front of it
    counter = 1
    #binding.pry
    @song_list.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

end
