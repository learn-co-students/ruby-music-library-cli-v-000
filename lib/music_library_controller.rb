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
    while input != "exit"
      puts "Welcome to Nick's CLI Music Library"
      puts "Whats Goodie?"
      # binding.pry
      input = gets.strip
      if input == "list songs"
        # puts "Lets List Songs"
        @@MusicLibrary.collect.with_index(1){|songs, index| puts "#{index}. #{songs.artist.name} - #{songs.name} - #{songs.genre.name}"}
      elsif input == "list artists"
        @@MusicLibrary.collect{|songs| puts "#{songs.artist.name}"}
      elsif input == "list genres"
        @@MusicLibrary.collect{|songs| puts "#{songs.genre.name}"}
      elsif "play song"
        @@MusicLibrary.collect{|songs| puts "Playing #{songs.artist.name} - #{songs.name} - #{songs.genre.name}"}
      end
    end
  end
end
