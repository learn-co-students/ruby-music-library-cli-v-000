class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  # def artists
  #   Artist.all.each.with_index(1) do |song, index|
  #     puts "#{index}. #{song}"
  #   end
  # end

end
