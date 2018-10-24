class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == 'exit'
      input = gets.strip

      case input
      when "list songs"
        Song.all.each_with_index {|song, index| puts "#{index +1}. #{song}"}

      when "list artists"
        Artist.all.each {|artist| puts "#{artist.name}"}

      when "list genres"
        Genre.all.each {|genre| puts "#{genre.name}"}

      when "play song"
        input = gets.strip.to_i
        puts "Playing #{Song.all[input-1]}"

      when "list artist"
        input = gets.strip
        Artist.all.each do |artist|
          if input = artist
            puts artist.songs
          end
        end

      when "list genre"
        input = gets.strip
        Genre.all.each do |genre|
          if input = genre
            puts genre.songs
          end
        end
      end
    end
  end
end
