class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = gets.chomp

    case 
    when input == "list songs"
      i = 1
      Song.all.each do |each_song|
        puts "#{i}. #{each_song.artist.name} - #{each_song.name} - #{each_song.genre.name}"
        i+=1
      end
    when input == "list artists"
      i = 1
      Song.all.each do |each_song|
        puts "#{each_song.artist.name}"
        i+=1
      end
    when input == "list genres"
      i = 1
      Song.all.each do |each_song|
        puts "#{each_song.genre.name}"
        i+=1
      end
    when input == "play song"
      i = 1
      Song.all.each do |each_song|
        puts "Playing #{each_song.artist.name} - #{each_song.name} - #{each_song.genre.name}"
        i+=1
      end
    when input == "list artist"
      artist_input = gets.chomp
      i = 1
      all_artists = []
      Song.all.each do |each_song|
        unless all_artists.include?(each_song.artist.name)
          all_artists << each_song.artist.name
        end
        i+=1
      end

      if all_artists.include?(artist_input)
        artist_songs = Artist.find_by_name(artist_input).songs
        artist_songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end  
      end

    when input == "list genre"
      genre_input = gets.chomp
      i = 1
      all_genres = []
      Song.all.each do |each_song|
        unless all_genres.include?(each_song.genre.name)
          all_genres << each_song.genre.name
        end
        i+=1
      end

      if all_genres.include?(genre_input)
        genre_songs = Genre.find_by_name(genre_input).songs
        genre_songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end  
      end
      
    end #case

    if input == "exit"
      "exit"
    else
      self.call
    end

  end #call

end #class
