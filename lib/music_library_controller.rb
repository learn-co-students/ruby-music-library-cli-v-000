class MusicLibraryController

  def initialize(path="./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end






  def call
    input = ""
    while input != "exit"
    
      puts "what do you want to do?"

      input = gets.chomp
      case input 
      when  "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        Genre.all.each {|g| puts g.name}
      when "play song"
        play
      when "list artist"
        list_a
      when "list genre"
        list_g
      

        
        
      end #case




    end #while
  end #call 

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each do |a|
      puts a.name
    end
  end

  def play
    puts "pick a song number"
    number = gets.chomp.to_i - 1
    selection = Song.all[number]
    puts "Playing #{selection.artist.name} - #{selection.name} - #{selection.genre.name}"
  end

  def list_a
    puts "pick an artist"
      artist = gets.chomp
      artist = Artist.find_by_name(artist)
      artist.songs.each do |s| 
        puts "#{artist.name} - #{s.name} - #{s.genre.name}"
      end

  end

  def list_g
    puts "pick an genre"
    genre = gets.chomp
    genre = Genre.find_by_name(genre)
    genre.songs.each do |s| 
      puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
    end

  



  end



      






  












end #class


  


