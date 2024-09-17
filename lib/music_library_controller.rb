class MusicLibraryController
  def initialize(path = "./db/mp3s")
    new_music = MusicImporter.new(path)
    new_music.import
  end

  def call
    puts "Welcome to your Music Library Controller"
    puts "What would you like to do?"
    puts "Enter 'help' for available commands."
    user_input = ""
    until user_input == "exit"
      user_input = gets.chomp
      case user_input
      when "help"
        puts "Available commands include: list songs, list artists, list genres, play song, list artists or list genre."
      when "list songs"
        Song.all.each.with_index(1) {|s, i| puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
      when "list artists"
        Artist.all.each.with_index(1) {|a, i| puts "#{i + 1}. #{a.name}"}
      when "list genres"
        Genre.all.each.with_index(1) {|g, i| puts "#{i + 1}. #{g.name}"}
      when "play song"
        puts "Which song number would you like to play?"
        user_input = gets.chomp.to_i
        s = Song.all[user_input - 1]
        puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
      when "list artist"
        puts "For which artist would you like a list?"
        user_input = gets.chomp
        artist = Artist.all.find{|a| a.name == user_input}
        artist.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
      when "list genre"
        puts "For which genre would you like a list?"
        user_input = gets.chomp
        genre = Genre.all.find{|g| g.name == user_input}
        genre.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
      when "exit"
        break
      end
      puts "Is there anything else you would like to do?"
    end
  end
end
