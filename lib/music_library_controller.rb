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
        play_song
      when "list artist"
        list_artist
      when "list genre"
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

  def artists
    count = 1
    Artist.all.each do |artist|
      puts "#{count}. #{artist.name}"
      count +=1
    end
  end

  def genres
    count = 1
    Genre.all.each do |genre|
      puts "#{count}. #{genre.name}"
      count +=1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    index = self.input_to_index(input)
    song = Song.all[index]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "Which artist do you want a list of songs for?"
    input = gets.strip
    artist = Artist.find_by_name(input)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "Which genre do you want a list of songs for?"
    input = gets.strip
    genre = Genre.find_by_name(input)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def input_to_index(input)
    number =input.to_i
    index = number - 1
    index
  end
end
