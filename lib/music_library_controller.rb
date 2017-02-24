class MusicLibraryController

  attr_accessor :path

  def initialize(path= "./db/mp3s")
    music_importer= MusicImporter.new(path)
    music_importer.import
  end

  def call
    input= ""
    while input != "exit"
      input = gets.strip
      case input
     when "list songs"
       songs
     when "list artists"
       artists
     when "list genres"
       genres
     when "list artist"
       list_artist
     when "list genre"
       list_genre
     when "play song"
       play_song
     end
   end
 end

      def songs
        Song.all.each.with_index(1) do |s, i|
        puts  "#{i}. #{s}"
        end
      end

      def artists
        Artist.all.each.with_index(1) do |a, i|
          puts "#{i}. #{a}"
        end
      end

      def genres
        Genre.all.each.with_index(1) do |g, i|
          puts "#{i}. #{g}"
        end
      end

      def play_song
        Song.all.each do |s|
        puts "Playing #{s}."
      end
      end

      def list_artist
        Artist.all.each do |a|
          a.songs.each do |s|
            puts "#{s}"
          end
        end
      end

      def list_genre
        Genre.all.each do |g|
          g.songs.each do |s|
            puts "#{s}"
          end
        end
      end
end
