class MusicLibraryController

  attr_accessor :path, :song

  def initialize(path = "./db/mp3s")
    n = MusicImporter.new(path)
    n.import
  end

  def call
    input = ''

    until input == 'exit'
      puts "Howdy. Can I help you?"
      input = gets.strip

      case input

      when "list songs"
        Song.all.each.with_index(1) {|s,i| puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}

      when "list artists"
        Artist.all.each.with_index(1) {|a,i| puts "#{i}. #{a.name}"}

      when "list genres"
        Genre.all.each.with_index(1) {|g,i| puts "#{i}. #{g.name}"}

      when "play song"
        puts "Enter the song number"
        input = gets.strip.to_i

        Song.all.each.with_index do |s, i|
          if input == i + 1
          puts "Playing #{Song.all[input-1].artist.name} - #{Song.all[input-1].name} - #{Song.all[input-1].genre.name}"
          end
      end

      when "list artist"
        puts "Enter artist's name"
        artist = gets.strip
        if artist = Artist.find_by_name(artist)
        artist.songs.each.with_index(1) do |s, i|
          puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end 
      
      when "list genre"
        puts "Enter genre:"
        genre = gets.strip
        if genre = Genre.find_by_name(genre)
          genre.songs.each.with_index(1) do |s,i|
            puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
          end
        end

      end
    end
  end
end# <--end class -->