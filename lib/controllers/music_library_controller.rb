class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    loop do
      input = gets.strip
      case input
        when "exit"
          break
        when "list songs"
          Song.all.each_with_index do |song, index|
            puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        when "list artists"
          Artist.all.each {|artist| puts artist.name}
        when "list genres"
          Genre.all.each {|genre| puts genre.name}
        when "play song"
          song_index = gets.strip.to_i - 1
          song = Song.all[song_index]
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        when "list artist"
          artist_name = gets.strip
          songs = Artist.find_by_name(artist_name).songs
          songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        when "list genre"
          genre_name = gets.strip
          songs = Genre.find_by_name(genre_name).songs
          songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
      end
    end

  end

end