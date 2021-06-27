class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call

    input=nil
    while input !="exit"
      puts "Please make a Choice"
      puts "(1) list songs"
      puts "(2) list artists"
      puts "(3) list genres"
      puts "(4) play a song"
      puts "(5) list artist"
      puts "(6) list genre"
      puts "To exit, please hit EXIT"
      input=gets.strip
  
      case input 
      when "list songs"
        Song.all.each_with_index {|song,i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list artists"
        Artist.all.each_with_index{|artist| puts "#{artist.name}"}
      when "list genres"
        Genre.all.each_with_index{|genre| puts "#{genre.name}"}
      when "play song"
        puts "Pick a song"
        input=gets.strip.to_i - 1
        puts "Playing #{Song.all[input].artist.name} - #{Song.all[input].name} - #{Song.all[input].genre.name}"
      when "list artist"
        puts "Pick an artist"
        input=gets.strip
        Artist.all.each do |artist|
          if artist.name==input
            artist.songs.each do |song|
            puts "#{artist.name} - #{song.name} - #{song.genre.name}"
            end
          end
        end
      when "list genre"
        puts "Pick a genre"
        input=gets.strip
        Genre.all.each do |genre|
          if genre.name=input
            genre.songs.each do |song|
              puts "#{song.artist.name} - #{song.name} - #{genre.name}"
            end
          end
        end
      when "exit"
        "See you next time!"
      else 
        "puts Invlaid input, Please try again"
        call
      end
    end
  end
end
