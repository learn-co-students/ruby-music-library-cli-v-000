class MusicLibraryController

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to the game"
      input = gets.strip

      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
       when "play song"
        play_songs
       when "list artist"
        list_artist
      end
    end

  end


  def songs
    Song.all.each.with_index(1) do |s,i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def artists
    Artist.all.collect do |artist|
      puts artist.name
    end
  end

  def genres
    Genre.all.collect do |genre|
      puts genre.name
    end
  end

  def play_songs
    Song.all.collect do |s|
      puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artist

    Artist.all.collect do |artist_list|
      puts "#{artist_list.name} - #{artist_list.name} - #{artist_list.genre.name}"
    end
  end
end














