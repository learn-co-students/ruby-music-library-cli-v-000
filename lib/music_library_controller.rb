class MusicLibraryController
  def initialize(file_path='./db/mp3s')
    MusicImporter.new(file_path).import
  end

  def call
    puts "Welcome!"
    loop do
      puts "Please enter Command:"
      command=gets.strip
      case command
        when "list songs"
          Song.all.sort_by {|x| x.artist.name}.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
        when "list artists"
          Artist.all.each {|artist| puts artist.name}
        when "list genres"
          Genre.all.each {|genre| puts genre.name}
        when "list artist"
          artist_input = gets.strip
          if artist = Artist.find_by_name(artist_input)
            artist.songs.each_with_index { |s,i| puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
          end
        when "list genre"
          genre_input = gets.strip
          if genre = Genre.find_by_name(genre_input)
            genre.songs.each_with_index { |s,i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
          end
        when "play song"
          song_num = gets.strip
          puts "Playing #{Song.all[song_num.to_i-1].artist.name} - #{Song.all[song_num.to_i-1].name} - #{Song.all[song_num.to_i-1].genre.name}"
        end
      break if command=='exit'
    end
  end
end
