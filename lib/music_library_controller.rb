class MusicLibraryController
  attr_accessor :path

    def initialize(path='./db/mp3s')
      MusicImporter.new(path).import
    end

    def call
      input = nil
      while input != "exit"
        print "What do you want to do? (list songs, list artists, list genres, play song, list artist, list genre, or exit): "
        input = gets.strip
        if input == "list songs"
            Song.all.each_with_index do |song, index|
              puts "#{index + 1}. #{Song.print_song(song)}"
            end
        elsif input == "list artists"
          Artist.all.each do |artist|
            puts artist.name
          end
        elsif input == "list genres"
          Genre.all.each do |genre|
            puts genre.name
          end
        elsif input == "play song"
          print "Enter track number: "
          track_number = gets.strip.to_i - 1
          song = Song.all[track_number]
          puts "Playing #{Song.print_song(song)}"
        elsif input == "list artist"
          print "Enter artist name: "
          artist_name = gets.strip.capitalize
          Artist.find_by_name(artist_name).songs.each do |song|
            puts Song.print_song(song)
          end
        elsif input == "list genre"
          print "Enter genre: "
          genre_name = gets.chomp
          Genre.find_by_name(genre_name).songs.each do |song|
            puts Song.print_song(song)
          end
      end
    end
  end
end
