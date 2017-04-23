class MusicLibraryController

  def initialize(path = './db/mp3s')
    @library = MusicImporter.new(path).import
  end

  def call
    user_input = nil
    until user_input == "exit" do
      user_input = gets.chomp

      case user_input
      when "list songs"
        @library.each_with_index do |song, index|
          puts "#{index + 1}. #{song.chomp('.mp3')}"
        end #do each
      when "list artists"
        Artist.all.each {|artist| puts artist.name}
      when "list genres"
        Genre.all.each {|genre| puts genre.name}
      when "play song"
        index_of_song = gets.chomp.to_i
        puts "Playing #{@library[index_of_song - 1].chomp('.mp3')}"
      when "list artist"
        artist_from_input = gets.chomp
        artist = Artist.find_by_name(artist_from_input)
        artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list genre"
        genre_from_input = gets.chomp
        genre = Genre.find_by_name(genre_from_input)
        genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      end # case end

    end #do until


  end # def until



end
