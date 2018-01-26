require 'pry'

class MusicLibraryController

# accept optional path, with a default
# instantiate a MusicImporter object > it will use this to import songs into the library
# Add a call method to ask for user input

  attr_reader :path

  def initialize (path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    user_input = ""

    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user_input = gets.strip
      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end

    end
  end

  def list_songs
    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
    # need artists + unique
    # then alphabetize and puts with number
  end

  def list_genres
    Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip

    if artist = Artist.find_by_name(user_input) #why does there need to be artist = here? How does this if statement work?
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip

    if genre = Genre.find_by_name(user_input)
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
  #   user_input = gets.strip.to_i
  #   i = user_input - 1
  #   if (1..Song.all.count).include?(i) #how does 1.. work? Would count work instead of length?
  #     #alphabetize
  #     Song.all.sort{ |a, b| a.name <=> b.name }
  #     binding.pry
  #   end
  #     a = Song.all[user_input -1].artist.name #this is not referring to the sorted Song array from above
  #     s = Song.all[user_input -1].name
  #     puts "Playing #{s} by #{a}"


      user_input = gets.strip.to_i
      i = user_input - 1
      if (1..Song.all.length).include?(user_input) # 1..3 checks if something is between 1 and 3
        song = Song.all.sort{ |a, b| a.name <=> b.name }[i]
        puts "Playing #{song.name} by #{song.artist.name}"
      end

    ### this number needs to be converted (-1)
    ### alphabetize Songs list and check that the number is included within the array count
    ### then iterate through to find the right one and output as puts
  end

end
