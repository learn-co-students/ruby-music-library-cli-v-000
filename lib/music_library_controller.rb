class MusicLibraryController

  attr_accessor :path
  attr_reader :call

    def initialize(path = './db/mp3s')
      @path = path
      new = MusicImporter.new(path)
      new.import
    end

    def call
      input = ""
       until input == "exit"
          input = gets.chomp

           if input == "list songs"
             Song.all.each_with_index {|value, index|
               puts "#{index += 1}. #{value.artist.name} - #{value.name} - #{value.genre.name}"}

           elsif
             input == "list #{self}"
             self.all.collect {|value| puts value.name}

          #  elsif
          #  input == "list genres"
          #  Genre.all.collect {|value| puts value.name}

          else
           song_list = Song.all.each_with_index {|value, index|
               counter = ""
               index == counter
               puts "Playing #{value.artist.name} - #{value.name} - #{value.genre.name}"
            }
              song_list

           end
         end
       end



end
