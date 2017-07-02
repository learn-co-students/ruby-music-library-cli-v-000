class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    all_music = MusicImporter.new(path)
    @all = []
    @all = all_music.import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.strip
      case input
         when "list songs"
           @all.sort.each.with_index(1) do |song, index|
           puts "#{index}. #{song}"
          end
          when "list artists"
            puts "The artists are: "
            @all.sort.each.with_index(1) do |song, index|
            song = song.split(" - ")
            puts "#{index}. #{song[0]}"
          end
          when "list genres"
            puts "The genres are: "
            @all.sort.each.with_index(1) do |song, index|
            song = song.split(" - ")
            puts "#{index}. #{song[2]}"
          end

          when "list artist"
            puts "Who's songs are you looking for?"
            input = gets.strip
            puts "Here is a list of the songs by them."
            @all.sort.each.with_index(1) do |song, index|
            x = song.split(" - ")
            puts "#{song}" if input == x[0]
          end
          when "list genre"
            puts "What genres are you looking for?"
            input = gets.strip
            puts "Here is a list of songs in that genre."
            @all.sort.each.with_index(1) do |song, index|
            x = song.split(" - ")
            genre = x[2].split(".")
            puts "#{song}" if input == genre[0]
          end
        when "play song"
          songs = []
          puts "What song would you like to play?"
          input = gets.strip
          input = input.to_i
          @all.sort.each.with_index(1) do |song, index|
          songs <<  song
         end

         puts "Playing #{songs[input - 1]}"
      end
    end
  end
end
