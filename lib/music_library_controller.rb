class MusicLibraryController
  attr_reader :path
  attr_accessor :music_importer

  def initialize(path = './db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(path).import
  end

  def call
    input= ""

    while input != "exit"
      puts "Hello user!"
      puts "What would you like to listen to?"
        input = gets.strip
      case input
        when "list songs"
          Song.all.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
        when "list artists"
          Artist.all.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
        when "list genres"
          Genre.all.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
        when "list artist"
          input = gets.strip
          artist_songs(input)
        when "list genre"
          input = gets.strip
          genre_songs(input)
        when "play song"
          input = gets.strip.to_i
          play_song(input)
        else
          puts "exit"
      end
    end
  end

  def play_song(number)
    puts "Playing #{Song.all[number - 1].artist.name} - #{Song.all[number - 1].name} - #{Song.all[number - 1].genre.name}"
  end

  def artist_songs(name)
    Artist.find_by_name(name).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def genre_songs(name)
    Genre.find_by_name(name).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
end
