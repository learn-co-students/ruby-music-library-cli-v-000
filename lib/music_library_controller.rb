require 'pry'
class MusicLibraryController

attr_accessor :path
  def initialize(path = './db/mp3s')
    @path=path
    music_importer= MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_response = gets
    if user_response != 'exit'
      if user_response == 'list artists'
        self.list_artists
      elsif user_response == 'list songs'
        self.list_songs
      elsif user_response == 'list genres'
        self.list_genres
      elsif user_response == 'list artist'
        self.list_songs_by_artist
      elsif user_response == 'list genre'
        self.list_songs_by_genre
      elsif user_response == 'play song'
        self.play_song
      end
      call

    end

  end

  def list_songs
    array_of_songs = Song.all.sort {|a,b| a.name<=>b.name}

    i=0
    while i<array_of_songs.length
      puts "#{i+1}. #{array_of_songs[i].artist.name} - #{array_of_songs[i].name} - #{array_of_songs[i].genre.name}"
      i+=1
    end
    array_of_songs
  end

  def list_artists
    array_of_artists = Artist.all.collect {|artists| artists.name}
    array_of_artists = array_of_artists.uniq.sort {|a,b| a<=>b}

    i=0
    while i<array_of_artists.length
      puts "#{i+1}. #{array_of_artists[i]}"
      i+=1
    end
  end

  def list_genres
    array_of_genres = Genre.all.collect {|genres| genres.name}
    array_of_genres = array_of_genres.uniq.sort {|a,b| a<=>b}
    i=0
    while i<array_of_genres.length
      puts "#{i+1}. #{array_of_genres[i]}"
      i+=1
    end
  end


    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      name_of_artist = gets
      array_of_songs = Song.all.select {|song| song.artist == Artist.find_by_name(name_of_artist)}
      array_of_songs = array_of_songs.uniq.sort {|a,b| a.name<=>b.name}
      i=0
      while i<array_of_songs.length
        puts "#{i+1}. #{array_of_songs[i].name} - #{array_of_songs[i].genre.name}"
        i+=1
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      name_of_genre = gets
      array_of_songs = Song.all.select {|song| song.genre == Genre.find_by_name(name_of_genre)}
      array_of_songs = array_of_songs.uniq.sort {|a,b| a.name<=>b.name}
      i=0
      while i<array_of_songs.length
        puts "#{i+1}. #{array_of_songs[i].artist.name} - #{array_of_songs[i].name}"
        i+=1
      end
    end

    def play_song

      puts "Which song number would you like to play?"

      array_of_songs = Song.all.sort {|a,b| a.name<=>b.name}

      song_selection = gets
      if song_selection.to_i >0 && song_selection.to_i < Song.all.length
      puts "Playing #{array_of_songs[song_selection.to_i-1].name} by #{array_of_songs[song_selection.to_i-1].artist.name}"

      #else

      end


    end
end
