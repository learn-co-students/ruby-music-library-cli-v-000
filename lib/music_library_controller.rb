class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
     @path=path
     music_import = MusicImporter.new(path)
     music_import.import
  end

  def call
    puts "welcome to your music library"
    answer = ""
    while answer != "exit"
      answer = gets.strip
      case answer
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play song
      when "list artist"
        list_artist
      when "list_genre"
        list_genre
      end

    end
  end

  def songs
    count = 1
    Song.all.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count +=1
    end
  end
end
