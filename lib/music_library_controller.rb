class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Hello, welcome to the Music Library CLI."
    puts "Please make your selection:"
    puts "list songs, list artists, list genres"
    input = nil

    while input != "exit"
      input = gets.chomp
      flag = nil

      if Artist.find_by_name(input)
        flag = input
        input = "artist => songs"
      elsif Genre.find_by_name(input)
        flag = input
        input = "genre => songs"
      end

      case input
      when nil
        puts "Please make your selection:"
        puts "list songs, list artists, list genres, play song"
      when "list songs"
        Song.print_songs
      when "list artists"
        Artist.print_artists
      when "artist => songs"
        Artist.print_artist_songs(flag)
      when "genre => songs"
        Genre.print_genre_songs(flag)
      when "list genres"
        Genre.print_genres
      when "play song"
        song = gets.chop
        Song.play_song(song)
      end
    end
  end
end
