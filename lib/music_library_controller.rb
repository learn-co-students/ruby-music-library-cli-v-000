class MusicLibraryController
  # attr_reader :path

  def initialize(path = "./db/mp3s")
    # @path = MusicImporter.new(path).import
    importer = MusicImporter.new(path)
    importer.import
  end

  # def call
  #   input = gets

  #   while input != "exit"

  #     counter = 1
  #     playlist = Song.all.collect do |s|
  #       puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
  #       counter += 1
  #     end

  #     if input == "list songs"
  #       playlist.each do |s|
  #         puts s
  #       end
  #     elsif input == "list artists"
  #       Artist.all.each do |a|
  #         puts a.name
  #       end
  #     elsif input == "list genres"
  #       Genre.all.each do |g|
  #         puts g.name
  #       end
  #     else 
  #       s = Song.all[0]
  #       puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
  #     end
  #     input = gets
  #   end
  # end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
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

  def artists
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_artist
    puts "What artist, by name, would you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s|
        puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_genre
    puts "What genre, by name, would you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s|
        puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip
    chosen_song = Song.all[song_input.to_i-1]
    puts "Playing #{chosen_song.artist.name} - #{chosen_song.name} - #{chosen_song.genre.name}"
  end

  def songs
    Song.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end




end