require 'pry'
class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        Song.sort
        Song.all.each.with_index(1) do |x, y|
          puts "#{y}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
        end
      when "list artists"
        Artist.all.each.with_index(1) do |a, i|
          puts "#{i}. #{a}"
        end
      when "list genres"
        Genre.all.each.with_index(1) do |g, i|
          puts "#{i}. #{g}"
        end
      when "list artist"
        Song.all.each do |x|
          puts "#{x.artist.name}"
        end
        puts "Which artist?"
        input = gets.strip
        Song.all.each do |a|
          if a.artist.name == input
              a.artist.songs.each do |p|
                puts "#{a.artist.name} - #{p.name} - #{p.genre.name}"
              end
          end
        end
      when "list genre"
        puts "What genre?"
        input = gets.strip
        Genre.all.each do |g|
          if g.name == input
              g.songs.each do |p|
                puts "#{p.artist.name} - #{p.name} - #{p.genre.name}"
              end
          end
        end
      when "play song"
        puts "Which song number?"
        input = gets.strip
        Song.sort
        play_s = Song.all[input.to_i-1]
        puts "Playing #{play_s.artist.name} - #{play_s.name} - #{play_s.genre.name}"
      end
    end
  end
end
