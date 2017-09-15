class MusicLibraryController
  def initialize(path = './db/mp3s')
    new_importer = MusicImporter.new(path)
    new_importer.import
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
    answer = ''
    while answer != 'exit'
      puts "What would you like to do?"
      answer = gets.chomp.downcase
      if answer == 'list songs'
        list_songs
      elsif answer == 'list artists'
        list_artists
      elsif answer == 'list genres'
        list_genres
      elsif answer == 'play song'
        play_song
      elsif answer == 'list artist'
        list_songs_by_artist
      elsif answer == 'list genre'
        list_songs_by_genre
      end
    end
  end

  def list_songs
    new_array = Song.all.sort {|a,b| a.name <=> b.name}
    new_array.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    new_array = Artist.all.sort_by{|artist| artist.name}
    new_array.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    new_array = Genre.all.sort_by{|genre| genre.name}
    new_array.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_choice = gets.chomp.downcase
    #
    new_array = Artist.all.sort {|a,b| a.name <=> b.name}

    new_array.each do |artist|
      if artist.name.downcase == artist_choice
        artist.songs.sort_by(&:name).each_with_index do |song, index|
          puts "#{index+1}. #{song.name} - #{song.genre.name}"
        end

      end
    end

   end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_choice = gets.chomp.downcase
    ####PRINT GENRE
    new_array = Genre.all.sort {|a,b| a.name <=> b.name}

    new_array.each do |genre|
      if genre.name.downcase == genre_choice
        genre.songs.sort_by(&:name).each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name}"
        end
      end
    end

  end

  def artists
    Song.all.each  do |song|
      puts song.artist.name
    end
  end

  def genres
  end

  def play_song
    puts "Which song number would you like to play?"
    song_choice = gets.chomp.to_i
    # 
    # Song.all.sort_by(&:name)

    song = Song.all[song_choice - 1]

    if song != nil && (song_choice < Song.all.length && song_choice > 1)
      puts "Playing #{song.name} by #{song.artist.name}"
    end

  end

end
