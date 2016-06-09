class MusicLibraryController

  attr_accessor :songs

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    @songs = importer.import
  end

  def call
    path = nil
    while path != "exit"
      path = gets.strip
      if path == "list songs"
        @songs.each_with_index do |s, i|
          # 1. Action Bronson - Larry Csonka - indie
          puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end

      if path == "list artists"
        @songs.each {|s| puts s.artist.name}
      end

      if path == "list genres"
        @songs.each {|s| puts s.genre.name}
      end

      if path == "play song"
        puts "Enter number between 1 and #{@songs.length + 1}"
        song = gets.strip
        song = song.to_i - 1
        puts "Playing #{songs[song].artist.name} - #{songs[song].name} - #{songs[song].genre.name}"
      end

      if path == "list artist"
        artist = gets.strip
        @songs.each do |s|
          puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" if artist == s.artist.name
        end
      end

      if path == "list genre"
        genre = gets.strip
        @songs.each do |s|
          puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" if genre == s.genre.name
        end
      end

    end
  end

end









