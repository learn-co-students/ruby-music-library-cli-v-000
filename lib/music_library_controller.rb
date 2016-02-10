class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    loop {
      input = gets.chomp
      case input
      when "list songs"
        list_songs
      when "list artists"
        Song.all.each { |song| puts "#{song.artist.name}" }
      when "list genres"
        Song.all.each { |song| puts "#{song.genre.name}" }
      when "play song"
        list_songs
        puts "Select the song you want to play"
        play = gets.chomp.to_i
        sorted_selection = Song.all.sort { |a,b| a.artist.name <=> b.artist.name }[play-1]
        puts "Playing #{sorted_selection.artist.name} - #{sorted_selection.name} - #{sorted_selection.genre.name}"
      when "list artist"
        puts "Input the artist"
        artist_input = gets.chomp
        Song.all.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.artist.name == artist_input }
      when "list genre"
        puts "Input the genre"
        genre_input = gets.chomp
        Song.all.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.genre.name == genre_input }
      when "exit"
        return
      end
    }
    # binding.pry
  end

  def list_songs
    Song.all.sort { |a,b| a.artist.name <=> b.artist.name }.each_with_index { |song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end
end
