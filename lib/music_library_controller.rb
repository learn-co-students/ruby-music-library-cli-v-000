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
         puts "Please enter your desired input"
          input = gets.chomp

           if input == "list songs"
             song_list = Song.all.each_with_index {|value, index| puts "#{index += 1}. #{value}"}
             song_list.to_s
              # binding.pry
           elsif
             input == "list artists"
             artist_list = Artist.all.each_with_index {|value, index| puts "#{index += 1}. #{value}";}
             artist_list
           elsif

           input == "list genres"
           genre_list = Genre.all.each_with_index {|value, index| puts "#{index += 1}. #{value}"}
            genre_list

          else
              puts "Please enter your desired input"

           end
         end
       end



end
