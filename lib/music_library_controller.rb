class MusicLibraryController
  def initialize(path = "./db/mp3s")
    new_music = MusicImporter.new(path)
    new_music.import
  end

  def call
    user_input = ""
    until user_input == "exit"
      user_input = gets.chomp
      case user_input
      when "list songs"
        sorted = Song.all.sort_by!{|s| s.artist.name}
        sorted.each_with_index {|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
      when "list artists"
        Artist.all.each_with_index {|a, i| puts "#{i + 1}. #{a.name}"}
      when "list genres"
        Genre.all.each_with_index {|g, i| puts "#{i + 1}. #{g.name}"}
      when "play song"
        user_input = gets.chomp.to_i - 2
        s = Song.all[user_input]
        puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
      when "list artist"
        user_input = gets.chomp
        artist = Artist.all.find{|a| a.name == user_input}
        artist.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
      when "list genre"
        user_input = gets.chomp
        genre = Genre.all.find{|g| g.name == user_input}
        genre.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
      when "exit"
        break
      end

    end
  end

end
