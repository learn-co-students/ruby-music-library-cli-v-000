class MusicLibraryController

  def initialize(path= "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""
    until input == 'exit'
      input = gets.strip
    case input

    when "list songs"
        Song.all.each.with_index(1) do |song, index|
        puts "#{index}. #{song.to_s}"
      end

    when "list artists"
      Artist.all.each.with_index(1) do |artist, index|
        puts "#{index}. #{artist.to_s}"
      end

    when "list genres"
      Genre.all.each.with_index(1) do |genre, index|
        puts "#{index}. #{genre.to_s}"
      end

    when "play song"
      puts "What number would you like to play?"
      play_song

    when "list artist"
      puts "Which artist songs would you like to see?"
      artist_songs

    when "list genre"
      puts "Which genre songs would you like to see?"
      genre_songs
    end
end

  def play_song
    input = gets.strip.to_i
    Song.all.each.with_index(1) do |song, index|
      if input == index
        puts "Playing #{song.to_s}."
      end
    end
  end

  def artist_songs
    input = gets.strip
      if artist = Artist.find_by_name(input)
        artist.songs.each do |song|
          puts "#{song.to_s}"
      end
    end
  end

  def genre_songs
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.each do |song|
        puts "#{song.to_s}"
      end
    end
  end



end
end
