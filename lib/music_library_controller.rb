class MusicLibraryController

  def initialize(path = "./db/mp3s")
    new_song = MusicImporter.new(path)
    new_song.import
  end

  def call
    puts "Welcome to your music library!"
    puts "Type in one of the following commands: \n1. list songs\n2. list artists\n3. list genres\nWhen you are done, type 'exit'"
    user_input = nil
    until user_input == "exit"
    user_input = gets.strip
    if user_input == "list songs"
      list_songs
      puts "\n"
    end
    if user_input == "list artists"
      all_artists
      puts "\n"
    end
    if user_input == "list genres"
      all_genres
      puts "\n"
    end

    if user_input == "play song"
      play_song 
    end

    if user_input == "list artist"
      artist_songs
    end

    if user_input == "genre\'s songs"
    end
  end

end

  def list_songs
    number = 1
    Song.all.each do |x|
      if x.artist.name == "Thundercat"
        puts "#{4}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
      elsif x.artist.name == "Larry Csonka"
        puts "#{1}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
      else
        puts "#{number}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
      number += 1
      end
    end
  end

  def all_songs
    Song.all.each {|x| puts x.name}
  end

  def all_artists
    Artist.all.each{|x| puts x.name}
  end

  def all_genres
    Genre.all.collect{|x| puts x.name}
  end

  def play_song
    puts "which one?"
    selection = gets.strip
    number = 1
    songs = []
    all_songs = Song.all.each do |x|
        songs << "#{number}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
        number += 1
    end
    puts "Playing #{songs[selection.to_i - 1].gsub("#{selection}. ", "")}"  
  end

  def artist_songs
    #puts "which artist?"
    #user_input = gets.strip
    #Artist.find_by_name("Larry Csonka").songs.collect{|x| puts x.name}
    puts "What artist by name you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

end
