require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    user_input = ""
    while user_input != "exit"
      puts "Welcome to your Music Library!"
      puts "To begin, please enter a command:"
      user_input = gets.strip

      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        list_songs
        puts "Please enter the number of the song you want to listen to:"
        song_number = gets.strip.to_i - 1
        user_choice = Song.all[song_number]
        puts "Playing #{user_choice.artist.name} - #{user_choice.name} - #{user_choice.genre.name}"
      when "list artist"
        puts "Please enter an artist whose songs you wish to see:"
        artist = gets.chomp
        found_artist = Artist.find_by_name(artist)

        found_artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      when "list genre"
        puts "Please enter a genre whose songs you wish to see:"
        genre = gets.chomp
        found_genre = Genre.find_by_name(genre)

        found_genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end

    end
  end

  def list_songs
    Song.all.sort_by!{|a| a.artist.name}.each.with_index(1){|s, index| puts "#{index}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end

  def list_artists
    Artist.all.sort_by!{|artist| artist.name}.each{|artist| puts artist.name}
  end

  def list_genres
    Genre.all.sort_by!{|genre| genre.name}.each{|genre| puts genre.name}
  end
end
