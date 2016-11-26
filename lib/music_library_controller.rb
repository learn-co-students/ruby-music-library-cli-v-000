class MusicLibraryController

  def initialize(path='./db/mp3s')
    importer = MusicImporter.new(path)
    @@MusicLibrary = importer.import
  end

  def call
    # binding.pry
    # song_names = @@MusicLibrary.collect{|songs| songs.name}
    # artist_names = @@MusicLibrary.collect{|songs| songs.artist.name}
    # genres = @@MusicLibrary.collect{|songs| songs.genre.name}
    # songs = @@MusicLibrary.collect.with_index(1){|songs, index| "##{index}. #{songs.artist.name} - #{songs.name} - #{songs.genre.name}"}
    input = ""
    puts "Welcome to Nick's CLI Music Library"
    while input != "exit"
      puts "Whats Goodie?"
      input = gets.strip
      if input = "list songs"
        @@MusicLibrary.collect.with_index(1){|songs, index| "#{index}. #{songs.artist.name} - #{songs.name} - #{songs.genre.name}"}






      # case input
      # when "list songs"
      #   #1. Action Bronson - Larry Csonka - indie
      #   @@MusicLibrary.collect.with_index(1){|songs, index| "#{index}. #{songs.artist.name} - #{songs.name} - #{songs.genre.name}"}
      # when "list artists"
      #   @@MusicLibrary.collect{|songs| songs.artist.name}
      # when "list genres"
      #   @@MusicLibrary.collect{|songs| songs.artist.name}
      # when "list artist"
      #   artist
      # when "list genre"
      #   genre
      # when "play song"
      #   play_song
      end
    end
  end
end
