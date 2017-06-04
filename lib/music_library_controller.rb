require 'pry'
class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "\nWelcome to Music Library CLI."
    user_input = ""
    while user_input != "exit"

      puts "\nType in 'list songs', 'list artists', 'list genres', \n'play song', 'list artist songs' or 'list genre songs'"
      user_input = gets.strip

      case user_input
      when "list songs" then list_songs
      when "list artists" then list_artists
      when "list genres" then list_genres
      when "play song" then play_song
      when "list artist songs" then list_artist_songs
      when "list genre songs" then list_genre_songs
      end
    end
  end

  def list_songs
    Song.all.each.with_index { |song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

   def list_artists
     Artist.all.each {|artist| puts "#{artist.name}"}
   end

   def list_genres
     Genre.all.each {|genre| puts "#{genre.name}"}
   end

  def play_song
    puts "Please type in a song number you would like to play"
    user_input = gets.strip
    puts "Playing #{Song.all[user_input.to_i-1].artist.name} - #{Song.all[user_input.to_i-1].name} - #{Song.all[user_input.to_i-1].genre.name}"
  end

  def list_artist_songs
    puts "What artist are you interested in?"
    artist_input = gets.strip
    artist = Artist.find_by_name(artist_input)
    artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre_songs
    puts "What genre are you interested in?"
    genre_input = gets.strip
    genre = Genre.find_by_name(genre_input)
    genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
end
