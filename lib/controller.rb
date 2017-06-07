class MusicLibraryController

  attr_accessor :path

  def initialize(files_path = "./db/mp3s")
    @path = files_path
    MusicImporter.new(@path).import
  end

  def call
    input = ""

    while input != "exit"
      puts "Welcome!"
      puts "Please choose from the following:"
      puts "Type 'list songs' to list your songs"
      puts "Type 'list artists' to list your artists"
      puts "Type 'list genres' to list your genres"
      puts "Type 'play song' to play a song"
      puts "Type 'list artist' to list all the songs of one artist"
      puts "Type 'list genre' to list all the songs in a genre"


      input = gets.strip

      case input

      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "play song"
        self.play_song
      when "list artist"
        self.list_artist
      when "list genre"
        self.list_genre
      else
        "Please choose an acceptable option."
      end
    end
  end

    def list_songs
      list = Song.all.sort_by {|song| song.artist.name}.each_with_index do |song, index|
    puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
  list
end

  def list_artists
    Artist.all.uniq.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.uniq.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    list = list_songs
    puts "Choose the list number for the song you want:"
    num = gets.to_i
    index = num - 1
    puts "Playing #{list[index].artist.name} - #{list[index].name} - #{list[index].genre.name}"
  end

  def list_artist
    puts "What artist would you like to list songs for:"
    artist_choice = gets.strip
    Artist.find_by_name(artist_choice).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "What genre would you like to list songs for:"
    genre_choice = gets.strip
    Genre.find_by_name(genre_choice).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end
