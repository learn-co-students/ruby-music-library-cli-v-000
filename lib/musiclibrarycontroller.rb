require_all 'concerns'
require_all 'lib'

class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    loop do
      puts "Please enter: 'list songs', 'list artists', 'list genres', 'play song', 'list artist', 'list genre' 'exit' "
      input = gets.chomp.downcase
        case
        when input == "list songs"
          songs
        when input == "list artists"
          artists
        when input == "list genres"
          genres
        when input == "play song"
          play
        when input == "list artist"
          artist_songs
        when input == "list genre"
          genre_songs
        end
      
    break if input == "exit"
    end

  end

  def songs
   Song.all.each_with_index do |s, i|
    puts "#{i+1}." " #{s.artist.name} - " "#{s.name} - " "#{s.genre.name}"
    end
  end 

  def artists
    Song.all.each_with_index {|s, i| puts "#{i+1}." " #{s.artist.name}"}
  end

  def genres
    Song.all.each_with_index {|s, i| puts "#{i+1}." " #{s.genre.name}"}
  end

  def play
    puts "Enter a number to play that song:"
    number = gets.to_i
    puts "Playing #{Song.all[number-1].artist.name} - " "#{Song.all[number-1].name} - " "#{Song.all[number-1].genre.name}"
  end

  def artist_songs
    puts "Enter artist for a list of songs:"
      input = gets.chomp
      Artist.all.each do |a|
        if a.name == input
          a.songs.each do |s|
            puts "#{s.artist.name} - " "#{s.name} - " "#{s.genre.name}"
          end
       end
    end
  end

  def genre_songs
    puts "Enter genre for a list of songs:"
      input = gets.chomp
      Genre.all.each do |g|
        if g.name == input
          g.songs.each do |s|
            puts "#{s.artist.name} - " "#{s.name} - " "#{s.genre.name}"
          end
       end
    end
  end

end
