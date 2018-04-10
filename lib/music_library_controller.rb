class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input !="exit"
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


      case input
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
    # Song.all.each_with_index {|song,index|puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    ordered_songs = Song.all.uniq.sort_by {|song| song.name} #need to use "uniq" because there are duplicates of each song for some reason
        ordered_songs.each do |song|
          number = ordered_songs.index(song) + 1
          puts  "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
  end

  def list_artists
    ordered_artists = Artist.all.sort_by {|artist| artist.name}
    ordered_artists.each do |artist|
      number = ordered_artists.index(artist) + 1
      puts "#{number}. #{artist.name}"
    end
  end

  def list_genres
    # Genre.all.each {|genre| puts genre.name}
    ordered_genres = Genre.all.sort_by {|genre| genre.name}
    ordered_genres.each do |genre|
      number = ordered_genres.index(genre) + 1
      puts "#{number}. #{genre.name}"
    end

  end


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    if Artist.find_by_name(artist_name) != nil
      # Artist.find_by_name(specific_artist).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    # else
    #   puts "Please enter the name of an artist:"
    artist = Artist.all.select { |artist| artist.name == artist_name }.first #need to use .first b/c there are duplicates of each object and we want to select only one object
       if artist != nil
         ordered_songs = artist.songs.sort_by {|song| song.name}
         i = 1
         ordered_songs.each do |song|
           puts "#{i}. #{song.name} - #{song.genre.name}"
           i += 1
         end
       end
    end
  end

  # def list_genre
  #   puts "Enter genre"
  #   specific_genre = gets.chomp
  #   if Genre.find_by_name(specific_genre) != nil
  #     Genre.find_by_name(specific_genre).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  #   else
  #     puts "Genre does not exist"
  #   end
  # end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.all.select { |genre| genre.name == genre_name }.first
    if genre != nil
      ordered_songs = genre.songs.sort_by {|song| song.name}
      i = 1
      ordered_songs.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i += 1
      end
    end
  end



  def play_song

    puts "Which song number would you like to play?"
    song_number = gets.to_i
    if song_number > 0 && song_number < Song.all.length then
        song = Song.all[song_number - 1]
        # list_songs
        #  puts "#{song_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        ordered_songs = Song.all.uniq.sort_by {|song| song.name}
        puts  "Playing #{ordered_songs[song_number-1].name} by #{ordered_songs[song_number-1].artist.name}"
    # else

    end

 end
end
