require_relative "../concerns/concerns.rb"

class MusicLibraryController

  attr_reader :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    exited = false
    puts "Welcome to your Music Library!\n"
    
    until exited
      puts "I accept the following commands:"
      commands
      input = user_prompt("What say you? ")
      exited = input_parser(input)
    end
  end

  def commands
    puts "- list songs: Displays all the songs in your library."
    puts "- list artists: Displays all the artists in your library."
    puts "- list genres: Displays all the genres in your library."
    puts "- list artist: Displays all the songs by an individual artist in your library."
    puts "- list genre: Displays all the songs of a particular genre in your library."
    puts "- play song: Plays the selected song."
    puts "- exit: Exits the program.\n"
  end

  def user_prompt(msg)
    print msg
    gets.strip
  end

  def input_parser(input)
    parsed = input.split(" ")
    if parsed.size == 2 && parsed[0] == "list"
      list(parsed[1])
    elsif parsed.size == 2 && parsed[0] == "play" && parsed[1] == "song"
      play_song
    elsif parsed.size == 1 && parsed[0] == "exit"
      exit
    else
      puts "Invalid command.\n"
    end
  end

  def list(param)

    case param
    when "songs"
      list_all_songs
    when "artists"
      list_all_artists
    when "genres"
      list_all_genres
    when "artist"
      list_songs(Artist)
    when "genre"
      list_songs(Genre)
    else
      "Invalid command.\n"
    end

    false
  end

  def play_song
    num = user_prompt("Enter the song number: ")
    if num.to_i >= 1 && num.to_i <= Song.all.size
      song = Song.all[num.to_i-1]
      puts "\nPlaying #{song.artist.name} - #{song.name} - #{song.genre.name}\n"
    else
      puts "\nNo song with that number\n"
    end
    false
  end

  def exit
    true
  end

  def list_songs(catergory)

    if catergory.kind_of?(Concerns::Findable)
      input = user_prompt("Enter the #{catergory.to_s.downcase}:")
      found_item = catergory.find_by_name(input)
      if found_item
        found_item.songs.each{ |song| puts "\n#{song.artist.name} - #{song.name} - #{song.genre.name}\n"}
      else
        puts "\nSorry, no #{catergory.to_s.downcase} by that name in your library.\n"
      end
    end

  end

  def list_all_artists
    print "\n"
    Artist.all.each_with_index do |artist,num|
      puts "#{artist.name}"
    end
    print "\n"
  end

  def list_all_genres
    print "\n"
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
    print "\n"
  end

  def list_all_songs
    print "\n"
    Song.all.each_with_index do |song,num|
      puts "#{num+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    print "\n"
  end



end