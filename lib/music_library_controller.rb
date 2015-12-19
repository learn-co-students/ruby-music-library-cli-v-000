class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
     MusicImporter.new(path).import
  end
  def call
    puts "Please use these commands: 'list songs', 'list genres', 'list artists', 'play song', 'list artist', 'list genre', 'exit"
    exit_musiclibrary = false
    while !exit_musiclibrary
      input = gets.strip
      case input
        when 'list songs'
          Song.list
        when 'list genres'
          Genre.list
        when 'list artists'
          Artist.list
        when 'play song'
          puts "Pick a song number"
          song_num = gets.strip
          Song.play_song(song_num.to_i)
        when 'list artist'
          puts "Pick an artist"
          artist_choice = gets.strip
          Artist.choice_artist(artist_choice)
        when 'list genre'
          puts "Pick a genre"
          genre_choice = gets.strip
        Genre.choice_genre(genre_choice)
      when 'exit'
          puts "Exiting..."
          exit_musiclibrary = true
      else
          puts "Exiting..."
          exit_musiclibrary = true
      end
    end
  end
end