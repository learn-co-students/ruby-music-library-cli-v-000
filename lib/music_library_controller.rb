class MusicLibraryController

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to the Music Library"

    def ask_for_input
      # puts "Here are some commands you can use to navigate the library:"
      # puts "  List (lists songs in Library by Name)"
      # puts "  Artists (lists Artists with Songs in the Library)"
      # puts "  Genres (lists Genres with Songs in the Library)"
      puts "What would you like to do? (type 'exit' to quit)"
      input = gets.chomp
      songs = Song.all.sort_by!{|song| song.artist.name}
      if input.downcase == 'list songs'
        songs.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
        ask_for_input
      elsif input.downcase == 'list artists'
        Artist.all.each {|artist| puts artist.name }
        ask_for_input
      elsif input.downcase == 'list genres'
        Genre.all.each {|genre| puts genre.name }
        ask_for_input
      elsif input.downcase == 'play song'
        puts "which song would you like to play?"
        answer = gets.chomp.to_i
        return if answer == 'exit'
        puts "Playing #{songs[answer-1].artist.name} - #{songs[answer-1].name} - #{songs[answer-1].genre.name}"
        ask_for_input
      elsif input.downcase == 'list artist'
        puts "which artist's songs would you like to list?"
        answer = gets.chomp
        return if answer == 'exit'
        if Artist.find_by_name(answer)
          Artist.find_by_name(answer).songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        else
          puts "Sorry, I don't have any songs by that artist."
        end
        ask_for_input
      elsif input.downcase == 'list genre'
        puts "which genre's songs would you like to list?"
        answer = gets.chomp
        return if answer == 'exit'
        if Genre.find_by_name(answer)
          Genre.find_by_name(answer).songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        else
          puts "Sorry, I don't have any songs of that genre."
        end
        ask_for_input
      elsif input.downcase == 'exit'
        return
      else
        puts "I didn't understand that."
        ask_for_input
      end
    end
    ask_for_input


  end

end
