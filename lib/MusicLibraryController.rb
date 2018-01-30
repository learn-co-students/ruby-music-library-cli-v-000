class MusicLibraryController


  def initialize(path = "./db/mp3s")

    importer = MusicImporter.new(path)
    importer.import
  end


  def call

  input = " "
  while input != "exit"
    puts "Hey you! We got some jamz here."
    puts "Tell me what you want to do, cuz I aint got all day."
    puts "You gots limited choices. You can ask me to list artists, songs, and genres."
    puts "Or you can ask me to play songs."
   input = gets.chomp
   case input
     
     when "list songs"
      songs
     when "list artists"
      artists
    when "list genres"
      genres
    when "list artist"
      list_artists_songs
    when "list genre"
      list_genres_songs
    when "play song"
      play_song

   end
 end

  end


  def songs
    Song.all.each.with_index(1) do |song,index|
     puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end

  def artists
    Artist.all.each.with_index(1) do |artist,index| 
    print "#{index}. #{artist.name}"
    end
  end


  def genres
    Genre.all.each.with_index(1) do |genre,index|
      print "#{index}. #{genre.name}"
  end
end


  def play_song
    puts "Tell me which song you would like to hear. Do it by index number, not song name, because I am only a machine and that it how I like to do things...with numbers."
    song_input = gets.chomp
    puts "Playing #{Song.all[song_input.to_i-1].artist.name} - #{Song.all[song_input.to_i-1].name} - #{Song.all[song_input.to_i-1].genre.name}"
  end


  def list_artists_songs
    puts "Name the artist whose songs you want me to list."
    artists_input = gets.chomp
    artist = Artist.find_by_name(artists_input)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    
    
  end


  def list_genres_songs
    puts "Name the genre whose songs you want me to list."
    genre_input = gets.chomp
    genre = Genre.find_by_name(genre_input)
    genre.songs.each do |song|
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    

  end

end