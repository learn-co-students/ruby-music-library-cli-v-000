class MusicLibraryController
      attr_accessor :path
      
  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  
  def call
    answer = nil
    while answer != 'exit'
      answer = gets
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    case answer
       when 'list songs'
         self.list_songs
       when 'list artists'
         self.list_artists
       when 'list genres'   
         self.list_genres
       when 'list artist'
         self.list_songs_by_artist
       when 'list genre'
         self.list_songs_by_genre
      when 'play song'
          self.play_song
    end  
     answer = gets 
    end   
  end
  
  def list_songs
    song_array = Song.all.sort_by { |song| song.name }
     song_array.each_with_index do |song,i| 
       puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end
  
  def list_artists
    artist_array =  Artist.all.sort_by { |artist| artist.name}
      artist_array.each_with_index do | artist, i|
        puts "#{i+1}. #{artist.name}"
      end  
  end 
  
  def list_genres
    genre_array = Genre.all.sort_by { |genre| genre.name}
      genre_array.each_with_index { |g,i| puts "#{i+1}. #{g.name}"}
  end
  
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets
       if Artist.find_by_name(answer) != nil
        artist = Artist.find_by_name(answer)
        artist = artist.songs.sort_by {|song| song.name}
        artist.each_with_index { |song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
      end  
  end
  
    def list_songs_by_genre
    puts "Please enter the name of a genre:"
    answer = gets
       if Genre.find_by_name(answer) != nil
        genre = Genre.find_by_name(answer)
        genre = genre.songs.sort_by {|song| song.name}
        genre.each_with_index do |song, i|
          puts "#{i+1}. #{song.artist.name} - #{song.name}"
        end
      end    
    end
    
    def play_song
      puts "Which song number would you like to play?"
      answer = gets
      song_array = Song.all.sort_by { |song| song.name }
      if  answer.to_i - 1  > -1 && song_array[answer.to_i - 1] != nil
        song = song_array[answer.to_i - 1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end  
    end
    
  
end

