class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    retrieve = MusicImporter.new(path)
    retrieve.import
  end

  def call
    reply = ""
    while reply != "exit"
      puts "Music Library Interface"
      puts "If you want to list your songs, artists, or genres,"
      puts "Please type: list (choice)"
      puts "If you want to play a song,"
      puts "Please type: play song"
      puts "If you want a list of a certain artist's songs,"
      puts "Please type: list artist"
      puts "And finally, if you want a list of songs in a genre,"
      puts "Type: list genre"
      puts "Please enter choice:"
      reply = gets.chomp
      if reply == "list songs"
        list_songs
      elsif reply == "list artists"
        list_artists
      elsif reply == "list genres"
        list_genres
      elsif reply == "play song"
        play_song
      elsif reply == "list artist"
        list_artist
      elsif reply == "list genre"
        list_genre
      end
    end
  end

  def list_songs
    ret_array = []
    Song.all.each do |song|
      ret_array.push [song.artist.name, song.name, song.genre.name]
    end
    ret_array_sorted = ret_array.sort_by { |array| array[0] }
    ret_array_sorted.each_with_index do |song, ind|
      puts "#{ind + 1}. #{song[0]} - #{song[1]} - #{song[2]}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def play_song
    ret_array = []
    Song.all.each do |song|
      ret_array.push [song.artist.name, song.name, song.genre.name]
    end
    ret_array_sorted = ret_array.sort_by { |array| array[0] }
    ret_array_sorted.each_with_index do |song, ind|
      puts "#{ind + 1}. #{song[0]} - #{song[1]} - #{song[2]}"
    end
    puts "Please choose a song by track number:"
    choice = gets.strip
    puts "Playing #{ret_array_sorted[choice.to_i - 1][0]} - #{ret_array_sorted[choice.to_i - 1][1]} - #{ret_array_sorted[choice.to_i - 1][2]}"
  end

  def list_artist
    puts "Please type the artist's name for their list of songs:"
    choice = gets.strip
    if artist = Artist.find_by_name(choice)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "Please type the genre's name for their list of songs:"
    choice = gets.strip
    if genre = Genre.find_by_name(choice)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end
