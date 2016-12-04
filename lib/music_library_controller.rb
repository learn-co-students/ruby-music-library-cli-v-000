require 'pry'

class MusicLibraryController



  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = nil
    while input != "exit"
      puts "Hey! Guess what time it is! Music Library Time!!!"
      puts "What you want me to list fam? Start off saying lists _______, your choices are artists,songs, genres"
      input = gets.chomp
      case input
      when "list songs"
       songs
     when "list artists"
       lists_artists
     when "list genres"
       lists_genres
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
   Song.all.each.with_index(1) do |s, i|
     puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
   end
  end

  def lists_artists
   Artist.all.each.with_index(1) do |artist, index|
    puts "#{index}. #{artist.name}"
   end
  end

  def lists_genres
   Genre.all.each.with_index(1) do |genre, index|
     puts "#{index}. #{genre.name}"
   end
  end

  def play_song
    puts "What song would you like to play my friend?"
    user_input = gets.chomp
    puts "Playing #{Song.all[user_input.to_i - 1].artist.name} - #{Song.all[user_input.to_i - 1].name} - #{Song.all[user_input.to_i - 1].genre.name}"
  end

  def list_artist
    puts "What artist songs do you want to listen too? Type an artist now."  #"Real Estate - Green Aisles - country")
    user_input = gets.chomp
    artist = Artist.find_by_name(user_input)
    artist.songs.each do |s|
      puts "#{artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_genre
    puts "What genre do you want to listen too? Type a genre now"  #("Thundercat - For Love I Come - dance")
    user_input = gets.chomp
    genre = Genre.find_by_name(user_input)
    genre.songs.each do |s|
      puts "#{s.artist.name} - #{s.name} - #{genre.name}"
    end
  end



end
