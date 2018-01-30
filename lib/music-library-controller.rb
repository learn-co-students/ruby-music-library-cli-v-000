class MusicLibraryController

attr_accessor :path, :library, :input
extend Concerns::Findable

  def initialize(path = "./db/mp3s")
    @path = path
    @library = MusicImporter.new(@path)
    @library.import

  end

  def main_menu
    puts "What would you like to do?"
    puts "Show all artists?"
    puts "  Type 'list artists'"
    puts "Show all songs?"
    puts "  Type 'list songs'"
    puts "Show all genres?"
    puts "  Type 'list genres'"
    puts "Play music now"
    puts "  Type 'play song'"
    @input = gets.strip
  end

  def call
    main_menu

    until @input == "exit"
            if @input == "list songs"
              @library.files.each.with_index(1) do |file, index|
                puts "#{index}. #{file.split(".").first}"
              end

            elsif @input == "play song"
              puts"Select Number"
              @library.files.each.with_index(1) do |file, index|
                puts "#{index}. #{file.split(".").first}"
              end
              song_num = gets.strip.to_i
              puts"Playing #{@library.files[(song_num - 1)]}"

            elsif @input == "list artists"
              Artist.all.each {|artist| puts artist.name}
              puts "Type Artist to show their songs"

              elsif

              lib_copy = @library.files.dup.keep_if{|index| index.split(" - ").first.split(" - ")}#include?(@input)}
              lib_copy.each {|index| puts "#{index}" }

            elsif @input == "list genres"
                Genre.all.each {|genre| puts genre.name}
               puts "Type Genre to show its songs"

             elsif lib_copy = @library.files.collect {|file|file.split(".").first.split(" - ")}
               #lib_copy.each {|x| puts "#{x}"}
               lib_copy.keep_if {|file| file.last == @input}
               lib_copy.each {|file| puts"#{file.join(" - ")}"}

            elsif @input == "play song"
              puts"Select Number"


            else
              puts "Invalid choice"
              @input = gets.strip
            end
            puts "Make another selection or 'exit'"
            @input = gets.strip
    end####END OF UNTIL   .include?("artist_input")
  end####END OF CALL METHOD
#binding.pry
end