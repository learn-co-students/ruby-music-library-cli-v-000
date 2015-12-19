class MusicLibraryCLI

  def initialize
    puts "Welcome to your music library. Press any key to continue, or q to quit."
    menu
  end



  def menu
    puts "1. list songs\n2. list artists\n3. list genres\n4.play song\n5.List songs by artist\n6.List songs by genre"
    puts "So whatcha wanna do?"
    action = gets.strip
    if action == "exit"
      puts "So long, sucker."
    else 
      menu_actions(action)
    end
  end

  def menu_actions(action)
    if action == 1
      list_songs
    elsif action == 2
      list_artists
    elsif action == 3
      list_genres
    elsif action == 4
      play_song
    elsif action == 5
      artist_songs
    elsif action == 6
      genre_songs
    else
    end

    menu
  end

  def list_artists
    #This should just iterate and return names, not the objects
    # puts Artist.all

  end

  def list_songs
    #see note for method above
    # puts Song.all

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