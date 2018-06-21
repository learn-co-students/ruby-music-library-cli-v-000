require 'pry'

class MusicLibraryController

  attr_accessor :song, :genre, :artist

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
		importer.import
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
      end
    end
end

  def list_songs
		Song.all.sort_by{|s| s.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist} - #{song} - #{song.genre}"
		end
	end

	def list_artists
		Artist.all.sort_by{|a| a.name}.each.with_index(1) do |artist, index|
			puts "#{index}. #{artist}"
			end
		end


	  def list_genres
	      Genre.all.sort_by{|g| g.name}.each.with_index(1) do |genre, index|
	        puts "#{index}. #{genre}"
	      end
	    end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
		artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
			artist.songs.sort_by{|s| s.name}.each.with_index(1) do |song,index|
				puts "#{index}. #{song} - #{song.genre}"
	 end
  end
end

def list_songs_by_genre
	puts "Please enter the name of a genre:"
	genre_input = gets.strip
	if genre = Genre.find_by_name(genre_input)
		genre.songs.sort_by{|s| s.name}.each.with_index(1) do |song,index|
			puts "#{index}. #{song.artist} - #{song}"
    end
  end
end

def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input.between?(1, Song.all.length)
      song = Song.all.sort_by(&:name)[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
     if song
    end
  end
end
end
