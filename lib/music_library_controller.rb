class MusicLibraryController

  def initialize(path='./db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "========== Music Library CLI =========="
      puts "What do you want to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list genre"
        list_genre
      when "list artist"
        list_artist
      end
    end
  end

  def songs
    Song.all.each.with_index(1) { |song, i| puts "#{i}. #{song}" }
  end

  def artists
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def genres
    Genre.all.each { |genre| puts genre.name }
  end

  def play_song
    puts "Select song number you want to play: "
    input = gets.strip
    puts "Playing #{Song.all[input.to_i-1]}"
  end

  def list_artist
    puts "What artist by name would you like to list songs for?"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.each do |song, i|
        puts "#{i}. #{song}"
      end
    end
  end

  def list_genre
    puts "What genre do you want to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each.with_index do |g, i|
        puts "#{i}. #{g}"
      end
    end
  end
end