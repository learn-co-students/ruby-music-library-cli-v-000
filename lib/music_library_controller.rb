class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call
  puts "Welcome to your music library. What would you like to do?"
  # ask for user input
  input = gets.strip.downcase

    while input != "exit" # as long as it isn't exit, keep asking
      if input == "list songs"
        order = 1
          Song.all.sort! { |a,b| a.artist.name.downcase <=> b.artist.name.downcase }
          Song.all.each do |song|
            puts "#{order}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            order += 1
          end

        elsif input == "list artists"
        order = 1
          Artist.all.sort! { |a,b| a.name.downcase <=> b.name.downcase }
          Artist.all.each do |artist|
            puts "#{order}. #{artist.name}"
            order += 1
          end

        elsif input == "list genres"
          order = 1
          Genre.all.sort! { |a,b| a.name.downcase <=> b.name.downcase }
          Genre.all.each do |genre|
            puts "#{order}. #{genre.name}"
            order += 1
          end

        elsif input == "play song"
          puts "What song shall I play?"
          newinput = gets.strip.to_i-1
          Song.all.sort! { |a,b| a.artist.name.downcase <=> b.artist.name.downcase }
          song = Song.all[newinput]
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"


        elsif input == "list artist"
          puts "Who is the artist which you would like a list of songs for?"
          newinput = gets.strip
          artist = Artist.find_by_name(newinput)
              artist.songs.each do |song|
                puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
              end

        elsif input == "list genre"
          puts "Which genre would you list a list of songs for?"
          newinput = gets.strip
          genre = Genre.find_by_name(newinput)
            genre.songs.each do |song|
                puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
    end
    input = gets.strip.downcase # ask again to keep loop going.
    end
  end
end
