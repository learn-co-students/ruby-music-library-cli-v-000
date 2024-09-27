class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import 
  end 

  def call 
    puts "Welcome to your music library."
    exit_flag = false
    while !exit_flag 
    input = gets.strip.upcase
    case input
    when 'LIST SONGS'
      Song.print_all
    when 'LIST GENRES'
      Genre.print_all
    when 'LIST ARTISTS'
      Artist.print_all
    when 'PLAY SONG'
      Song.print_all 
      puts "Which song would you like to play?"
      song_input = gets.strip.to_i - 1
      print "Playing "
      Song.all[song_input].print 
    when 'LIST ARTIST'
      Artist.print_all
      puts "Which artist?"
      Artist.find_or_create_by_name(gets.strip).songs.each do |song|
            song.print
      end
      when 'LIST GENRE'
          Genre.print_all
          puts 'Which genre?'
          Genre.find_or_create_by_name(gets.strip).songs.each do |song|
          song.print
      end
      when 'EXIT'
          exit_flag = true
      else
    end 
  end 
end 

end