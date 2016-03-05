class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    # binding.pry
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
  end

  def call
    puts "What would you like to do?"
    puts 'list songs'
    puts 'list artists'
    puts 'list genres'
    puts 'play song'
    puts 'list artist'
    puts 'list genre'

    input = gets.strip

    loop do
      case input
        when 'list songs'
          Song.all.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        when 'list artists'
          Artist.all.each do |artist|
            puts artist.name
          end
        when 'list genres'
          Genre.all.each do |genre|
            puts genre.name
          end
        when 'play song'
          puts "What song would you like to play?[1-99]"
          song_input = gets.strip.to_i
          if song_input.between?(1,99)
            song = Song.all[song_input-1]
            puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        when 'list artist'
          Artist.all.each do |artist|
            puts artist.name
          end
          puts "Name the artist you would like to list"
          artist_input = gets.strip
          if (artist = Artist.find_by_name(artist_input))
            artist.songs.each do |song|
              puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
          end
        when 'list genre'
          Genre.all.each do |genre|
            puts genre.name
          end
          puts "What genre would you like to list?"
          genre_input = gets.strip
          if (genre = Genre.find_by_name(genre_input))
            genre.songs.each do |song|
              puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
          end
        when 'exit'
          break
      end
      puts "What would you like to do?"
      input = gets.strip
    end
  end

end
