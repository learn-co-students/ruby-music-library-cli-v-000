class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call

    user_input = ""

    until user_input == "exit"
      puts "What would you like to do?"
      user_input = gets.chomp

      case user_input
      when "list songs"
        Song.all.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list artists"
        Artist.all.each {|artist| puts "#{artist.name}"}
      when "list genres"
        Genre.all.each {|genre| puts "#{genre.name}"}
      when "exit"
        puts "Goodbye"
      when "play song"
        play_song
      when "list artist"
        list_artist_songs
      when "list genre"
        list_genre_songs
      else
        puts "Please try again."
      end # case statement
    end # until

    def play_song
      puts "Which song would you like to play?"
      song = Song.all[gets.to_i - 1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

    def list_artist_songs
      puts "Enter artist name: "
      answer = gets.chomp
      Artist.find_by_name(answer).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}   
    end

    def list_genre_songs
      puts "Entre genre: "
      answer = gets.chomp
      Genre.find_by_name(answer).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end  

  end #call
end
