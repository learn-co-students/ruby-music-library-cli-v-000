class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    user_input = ""
    while user_input != "exit"
      user_input = gets
    end
  end


    def list_songs
      list = @music_importer.files
      list.sort_by!{|song| song.split(" - ")[1]}
      list.each_with_index {|val, index| puts "#{index+1}. #{val.chomp(".mp3")}"}
    end

    def list_artists
      list = Artist.all.map { |artist| artist.name}
      #binding.pry
      list.sort!
      list.each_with_index {|val, index| puts "#{index+1}. #{val}"}
    end

    def list_genres
      list = Genre.all.map {|genre| genre.name}
      #binding.pry
      list.sort!
      list.each_with_index {|val, index| puts "#{index+1}. #{val}"}
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist_name = gets
      artist = Artist.find_by_name(artist_name)
      if artist != nil
        list = artist.songs.sort_by{|song| song.name}
        list.map.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
     end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_name = gets
      genre = Genre.find_by_name(genre_name)
      if genre != nil
        list = genre.songs.sort_by{|song| song.name}
        list.map.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
     end
    end

    def play_song
      #self.list_songs
      puts "Which song number would you like to play?"
      files = @music_importer.files.sort_by {|song| song.split(" - ")[1]}
      song_number = gets.chomp
      index = song_number.to_i-1
      #binding.pry
      if index < files.size && index > 0
        puts "Playing #{files[index].split(" - ")[1]} by #{files[index].split(" - ")[0]}"
      end
    end
end
