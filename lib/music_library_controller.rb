class MusicLibraryController

  def initialize(path="./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Hi there, please type in one of my functions:
    list songs
    list artists
    list genres
    play song
    list artist
    list genre
    exit"
    input = gets.strip

    case input
      when 'list songs' 
        # => output should be "1. Action Bronson - Larry Csonka - indie" etc
        list_songs

      when 'list artists'
        list_artists

      when 'list genres'
        list_genres

      when 'play song'
        play_song
       

      when 'list artist'
        list_artist

      when 'list genre'
        list_genre
    end
    self.call unless input == 'exit'
  end


  def list_songs
    counter = 1
    Song.all.each do |song_instance| 
      puts "#{counter}. #{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
      counter += 1
    end
  end

  def play_song
    #output example: "Playing Action Bronson - Larry Csonka - indie"
    puts "which song number?"
    input = gets.strip.to_i - 1
    puts "Playing #{Song.all[input].artist.name} - #{Song.all[input].name} - #{Song.all[input].genre.name}"
  end

  def list_artists
    Song.all.each do |song_instance| 
      puts "#{song_instance.artist.name}"
    end
  end

  def list_genres
    Song.all.each do |song_instance| 
      puts "#{song_instance.genre.name}"
    end
  end

  def list_artist
    #example output: "Real Estate - Green Aisles - country"
                    #"Real Estate - It's Real - hip-hop"
    puts 'Which artist?'
    input = gets.strip
    Song.all.each do |song_instance| 
      if song_instance.artist.name == input
      puts "#{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
      end
    end
  end 

  def list_genre
    puts 'Which genre?'
    input = gets.strip
    Song.all.each do |song_instance| 
      if song_instance.genre.name == input
      puts "#{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
      end
    end
  end

end

