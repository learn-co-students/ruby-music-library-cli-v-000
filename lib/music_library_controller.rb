class MusicLibraryController
  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    user_input = gets.chomp
    while user_input != "exit"
      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "play song"
        puts "Which song number?"
        user_input = gets
        play_song(user_input.to_i)
      elsif user_input == "list artist"
        puts "Which artist?"
        user_input = gets
        artist_songs(user_input)
      elsif user_input == "list genre"
        puts "Which genre?"
        user_input = gets
        genre_songs(user_input)
      end

      user_input = gets
    end
  end

  def list_songs
    sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{formatted_song(song)}"
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

  def play_song(number)
    puts "Playing #{formatted_song(sorted_songs[number - 1])}"
  end

  def artist_songs(name)
    Artist.find_by_name(name).songs.each do |song|
      puts formatted_song(song)
    end
  end

  def genre_songs(name)
    Genre.find_by_name(name).songs.each do |song|
      puts formatted_song(song)
    end
  end

  private
  def sorted_songs
    Song.all.sort_by { |song| song.artist.name }
  end

  def formatted_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
