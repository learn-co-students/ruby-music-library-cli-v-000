require 'pry'

class MusicLibraryCLI

  def initialize
    #puts "Welcome to your music library."
    menu
  end



  def menu
    # binding.pry
    puts "1. list songs\n2. list artists\n3. list genres\n4.play song\n5.List songs by artist\n6.List songs by genre"
    puts "So whatcha wanna do?"
      input = gets.strip
      # binding.pry
      menu_actions(input)
      # binding.pry
    

    # if action == "exit"
    #   puts "So long, sucker."
    # else 
    #   menu_actions(action)
    # end
  end

  def menu_actions(input)
    if input == 1
      list_songs
    elsif input == 2
      list_artists
    elsif input == 3
      list_genres
    elsif input == 4
      play_song
    elsif input == 5
      artist_songs
    elsif input == 6
      genre_songs
    else
    end

    menu
  end

  def list_artists
    #This should just iterate and return names, not the objects
    # puts Artist.all

    puts @library.Artist.all.collect{|a| a.name}

  end

  def list_songs
    #see note for method above
    # puts Song.all
    counter = 0
    puts @library.Song.all.each{|s| 
      counter += 1
      puts "#{counter}. #{s.artist} - #{s.name} - #{s.genre}"

    }

  end

  def list_genres
    #see note for #list_artists
    # puts Genre.all
  end

  def play_song
    #google this
  end

  def artist_songs
    puts "Who you wanna hear?"
    input = gets.strip.split.capitalize.join
    puts Artist.find_by_name.songs
  end

  def genre_songs
    puts "What type of music you wanna hear?"
    input = gets.strip.split.capitalize.join
    puts Genre.find_by_name.songs
  end


end