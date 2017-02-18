require 'pry'

class MusicLibraryController
  # attr_accessor :path

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Please enter input."
    input = gets.strip
    # binding.pry
    puts input
    case input
    when "list songs"
      Song.all.each_with_index {|song, index| puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    when "list artists"
      Song.all.each_with_index {|song| puts song.artist.name}
    when "list genres"
      Song.all.each_with_index {|song| puts song.genre.name}
    when "play song"
      puts "Which song?"
        song_input = gets.strip
        song_index = song_input.to_i - 1
        puts "Playing #{Song.all[song_index].artist.name} - #{Song.all[song_index].name} - #{Song.all[song_index].genre.name}"
    when "list artist"
      puts "Which artist?"
        artist_input = gets.strip
          if Artist.find_by_name(artist_input)
            Artist.find_by_name(artist_input).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
          else
            puts "Artist not found."
          end
    when "list genre"
      puts "Which genre?"
        genre_input = gets.strip
          if Genre.find_by_name(genre_input)
            Genre.find_by_name(genre_input).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
          else
            puts "Genre not found."
          end
    end
    self.call unless input == "exit"
  end
end
