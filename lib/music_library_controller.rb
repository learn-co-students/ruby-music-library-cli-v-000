
class MusicLibraryController

  def initialize(path = "./db/mp3s")

   imported = MusicImporter.new(path)
   imported.import

  end

  def call
    user_input = ""
    while user_input != "exit"
      user_input = gets.strip

      case user_input
      when "list songs"

        Song.all.each_with_index do |song, index|
          index +=1
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      when "list artists"
        Artist.all.each do |artist|
          puts "#{artist.name}"

        end
      when "list genres"
        Genre.all.each do |genre|
          puts "#{genre.name}"

        end
      when "play song"
        Song.all.each do |songs|
          puts "Playing #{songs.artist.name} - #{songs.name} - #{songs.genre.name}"

        end


      when "list artist"
        puts "Which artist?"
        input = gets.strip
        found = Artist.find_by_name(input)
        found.songs.each do |each_song|

          puts "#{found.name} - #{each_song.name} - #{each_song.genre.name}"
        end

      when "list genre"
        puts "Which genre"
        input = gets.strip
        found = Genre.find_by_name(input)
        found.songs.each do |each_genre|
          puts "#{each_genre.artist.name} - #{each_genre.name} - #{found.name}"

        end
      end
    end
  end



end
