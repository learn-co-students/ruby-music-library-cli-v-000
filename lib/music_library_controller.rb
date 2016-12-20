class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    
    while input != "exit"
      input = gets

      if input.chomp == "list songs"
        sorted_array = self.get_sorted_array_of_songs
        counter = 1
        sorted_array.each do |song|
          puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          counter += 1
        end
      elsif input.chomp == "list artists"
        Song.all.each do |song|
          puts "#{song.artist.name}"
        end
      elsif input.chomp == "list genres"
        Song.all.each do |song|
          puts "#{song.genre.name}"
        end
      elsif input.chomp == "play song"
        song_number = gets.chomp
        song_to_play = get_sorted_array_of_songs[song_number.to_i - 1]
        artist_name = song_to_play.artist.name
        song_name = song_to_play.name
        genre_name = song_to_play.genre.name
        puts "Playing #{artist_name} - #{song_name} - #{genre_name}"
      elsif input.chomp == "list artist"
        artist_name = gets.chomp
        artist = Artist.find_by_name(artist_name)
        artist.songs.each do |song|
          puts "#{artist.name} - #{song.name} - #{song.genre.name}"
        end
      elsif input.chomp == "list genre"
        genre_name = gets.chomp
        genre = Genre.find_by_name(genre_name)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{genre.name}"
        end
      end
    end
  end

  def get_sorted_array_of_songs
    array = []
    sorted_array = []
    Song.all.collect do |song|
      array << song
    end

    sorted_array = array.sort_by {|song| song.artist.name}
    sorted_array
  end

end
