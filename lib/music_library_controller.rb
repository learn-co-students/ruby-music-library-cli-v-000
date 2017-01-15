class MusicLibraryController
  attr_reader :artist, :song, :genre

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
      user_input = ""
      while user_input != "exit"
        puts "What would you like to listen to?"
        user_input = gets.strip
      if user_input == "list songs"
        Song.all.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
      elsif user_input == "list artists"
        Artist.all.each { |a| puts a.name }
      elsif user_input == "list genres"
        Genre.all.each { |g| puts g.name }
      elsif user_input == "play a song"
        Song.all.detect { |song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      end
    end
  end


end
