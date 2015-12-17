class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    choice = nil
    while choice != "exit"
      puts "Your choices are: list songs, list artists, list genres, play song, list artist, list genre, or exit."
      choice = gets.downcase.chomp

      case choice
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "exit"
        puts "Have a nice day!"
      else puts "Invalid choice."
      end
    end
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.fullname}"
    end
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    puts "Which song would you like to play?"
    song_number = nil
    until song_number.to_i.between?(1,Song.all.count) do
      puts "Please enter a number: 1 - #{Song.all.count}."
      song_number = gets.to_i
    end
    puts "Playing #{Song.all[song_number-1].fullname}"
  end

  def list_artist
    puts "Whose songs would you like to see?"
    artist_choice = gets.downcase.chomp
    if Artist.all.any? {|artist| artist.name.downcase == artist_choice}
      Artist.all.detect {|artist| artist.name.downcase == artist_choice}.songs.each {|song| puts song.fullname}
    else
      puts "You don't have any songs by #{artist_choice.upcase} in your library. Select list artists to see your choices, then try again."
    end
  end

  def list_genre
    puts "Which genre would you like to see songs for?"
    genre_choice = gets.downcase.chomp
    if Genre.all.any? {|genre| genre.name.downcase == genre_choice}
      Genre.all.detect {|genre| genre.name.downcase == genre_choice}.songs.each {|song| puts song.fullname}
    else
      puts "You don't have any #{genre_choice.upcase} songs in your library. Select list genres to see your choices, then try again."
    end
  end

end