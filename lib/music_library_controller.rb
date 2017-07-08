class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Welcome to the Music Library!"
    puts "Please input a command:"
    input = ""
    while input != "exit"
      input = gets.strip
      case input
      when "list songs"
        song_list = Song.all.collect {|song| "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
        song_list.sort.each_with_index {|song, i| puts "#{i + 1}. " + song}
      when "list artists"
        Artist.all.each {|artist| puts artist.name}
      when "list genres"
        Genre.all.each {|genre| puts genre.name}
      when "play song"
        puts "Which song would you like to play?"
          song_list = Song.all.collect {|song| "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
          song_list.sort!
          song_selection = gets.strip.to_i
        puts "Playing " + song_list[song_selection - 1]
      when "list artist"
        puts "Which artist would you like to see all of their songs?"
          artist_selection = gets.strip
          found_artist = Artist.find_by_name(artist_selection)
          found_artist.songs.each {|song| puts "#{found_artist.name} - #{song.name} - #{song.genre.name}"}
      when "list genre"
        puts "Which genre would you like to see all of its songs?"
          genre_selection = gets.strip
          found_genre = Genre.find_by_name(genre_selection)
          found_genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{found_genre.name}"}
      else
        puts "I accept the following commands:"
        puts 'list songs, list artists, list genres, play song, list artist, list genre'
      end
    end
    puts "exit"
  end
  
end
