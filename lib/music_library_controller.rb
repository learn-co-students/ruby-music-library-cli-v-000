class MusicLibraryController
  attr_accessor :rand_rejection

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import

  def call

    puts "   ((((TIME TO JAM))))"
    puts "   |   'List Songs'  |"
    puts "   |   'List Artists'|"
    puts "   |   'List Genres' |"
    puts "   |   'Play Song'   |"
    puts "   |   'Exit     '   |"
    puts "     Type Your Choice "
    input = gets.chomp

    if input.downcase != 'list songs' ||
       input.downcase != 'list artists' ||
       input.downcase != 'list genres' ||
       input.downcase != 'play song' ||
       input.downcase != 'exit'
       response = @rand_rejection.sample
       puts "______________________________"
       puts "  #{response}"
       puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

    if input.downcase == "list songs"
      Song.all.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end

    elsif input.downcase == "list artists"
       Artist.all.each{|a| puts "#{a.name}"}
    elsif input.downcase == "list genres"
       Genre.all.each{|g| puts "#{g.name}"}
    elsif input.downcase == "play song"
       puts "Select a Song"
       song_selection = gets.chomp
       play = Song.all[song_selection.to_i-1]
       puts "Playing #{play.artist.name} - #{play.name} - #{play.genre.name}"
    elsif input.downcase == "list artist"
      puts "Select An Artist"
      artist_selection = gets.chomp
      Song.all.each do |s|
        if s.artist.name == artist_selection
          puts "- #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
    elsif input.downcase == "list genre"
      puts "Select A Genre"
      genre_selection = gets.chomp
      Song.all.each do |s|
        if s.genre.name == genre_selection
          puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
    end
    if input.downcase != 'exit'
      call
    end
    end
  end
  @rand_rejection = [
    " Sory Mate! Chose Again.",
    "  No, no, no. Pick One  ",
    "  Let's try this again. ",
    "I know you can do better",
    "Try the choices above...",
    "Type in a selection guy.",
    "I know you want to party",
    "um... the choices above.",
    "Please, just the facts. ",
    " Party Party Party Party",
    "99 problems. THIS is one",
    "        :(              ",
    "   I SAY! TIME TO JAM   ",
    "You are a boss at choices",
    "C'mon let's get this goin",
    "All your base are belong to us!"
  ]
end
end
