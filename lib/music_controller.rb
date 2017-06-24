class MusicLibraryController

  def initialize(filepath="./db/mp3s")
    MusicImporter.new(filepath).import
  end

  def call
    puts "Welcome to your music library!"
    loop do
      puts "To list all of your songs, enter 'list songs'."
      user_input = gets
      break if user_input == exit
    end
  end

  def list_songs
    # artist - title - genre
      sorted_arr = Song.sorted_song_list
      sorted_arr.each_with_index do |s,i|
        puts "#{i+1}. #{s}"
      end
  end

  def list_artists
    artist_arr = Artist.all.collect { |a| a.name }
    artist_arr = artist_arr.sort
    artist_arr.each_with_index do |a,i| puts "#{i+1}. #{a}"
    end
  end

  def list_genres
    genre_arr = Genre.all.collect { |g| g.name }
    genre_arr = genre_arr.sort
    genre_arr.each_with_index do |g, i|
      puts "#{i+1}. #{g}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
      # binding.pry
      artist = Artist.find_by_name(user_input)
      if artist
        sorted_arr = artist.songs.sort_by do |s|
          s.name
        end
        sorted_arr.each_with_index do |s,i|
          puts "#{i+1}. #{s.name} - #{s.genre.name}"
        end
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
      # binding.pry
      genre = Genre.find_by_name(user_input)
      if genre
        sorted_arr = genre.songs.sort_by do |s|
          s.name
        end
        sorted_arr.each_with_index do |s,i|
          puts "#{i+1}. #{s.artist.name} - #{s.name}"
        end
      end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.to_i
    if user_input >= 1 && user_input <= Song.all.count && user_input != nil
      song_arr = Song.all.sort_by { |s| s.name }
      puts "Playing #{song_arr[user_input-1].name} by #{song_arr[user_input-1].artist.name}"
    end
  end

end
