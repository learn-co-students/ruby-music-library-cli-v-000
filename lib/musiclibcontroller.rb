require 'pry'

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @path = path
    @musicimporter = MusicImporter.new(path)
    @library = @musicimporter.import
  end

  def call

    input = nil
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      else
      end
    end
  end

  def list_songs
    list_counter = 0
    @library[0].sort! {|song, other_song| song.name <=> other_song.name}.each do |song|
      puts "#{list_counter+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      list_counter +=1
    end
  end

  def list_artists
    list_counter = 1
    artist_list =Artist.all.collect{|artist| artist.name}.uniq
    artist_list.sort!.each do |artist|
      puts "#{list_counter}. #{artist}"
      list_counter +=1
    end
  end

  def list_genres
    list_counter = 1
    genre_list = Genre.all.collect{|genre| genre.name}.uniq
    genre_list.sort!.each do |genre|
      puts "#{list_counter}. #{genre}"
      list_counter +=1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    found_artist = Artist.all.find {|artist| artist.name==artist_name}
    if found_artist != nil
      song_list = found_artist.songs.sort!{|a,b| a.name<=>b.name}
      counter = 1
      song_list.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter +=1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    found_genre = Genre.all.find {|genre| genre.name==genre_name}
    if found_genre != nil
      song_list = found_genre.songs.sort!{|a,b| a.name<=>b.name}
      counter = 1
      song_list.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter +=1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    list_counter = 0
    playlist = @library[0].sort! {|song, other_song| song.name <=> other_song.name}
    playlist.each do |song|
      #puts "#{list_counter+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      list_counter +=1
    end
    song_number = gets
    if song_number.to_i <=list_counter && song_number.to_i >0
      puts "Playing #{playlist[song_number.to_i-1].name} by #{playlist[song_number.to_i-1].artist.name}"
    end
  end
end
