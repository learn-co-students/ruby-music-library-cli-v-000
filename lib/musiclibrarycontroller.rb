# Music Library Controller class
#


class MusicLibraryController


  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
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
    command = ""
    while command != "exit" do
      command = gets.chomp
      case command
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      end

    end
  end

  def list_songs
    list = Song.all
    list.sort_by! {|x| x.name}
    list = list.each_with_index.map { |x, i| "#{i+1}. " + x.artist.name + " - " + x.name + " - " + x.genre.name}
    list.each do |tune|
      puts tune 
    end
  end

  def list_artists
    list = Artist.all
    list.sort_by! {|x| x.name}
    list = list.each_with_index.map { |x, i| "#{i+1}. " + x.name }
    list.each do |artist|
      puts artist 
    end
  end
  
  def list_genres
    list = Genre.all
    list.sort_by! {|x| x.name}
    list = list.each_with_index.map { |x, i| "#{i+1}. " + x.name }
    list.each do |genre|
      puts genre 
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_artist = gets.chomp
    artist = Artist.all.detect {|a| a.name == input_artist}
    if artist != nil
      list = artist.songs
      list.sort_by! {|x| x.name}
      list.each_with_index { |x, i| puts "#{i+1}. " + x.name + " - " + x.genre.name}
    end
    
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input_genre = gets.chomp
    genre = Genre.all.detect {|a| a.name == input_genre}
    if genre != nil
      list = genre.songs
      list.sort_by! {|x| x.name}
      list.each_with_index { |x, i| puts "#{i+1}. " + x.artist.name + " - " + x.name}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_choice = gets.chomp
    song_choice = song_choice.to_i
    if song_choice > 0 && song_choice < Song.all.count + 1
      list = Song.all
      list.sort_by! {|x| x.name}
      song_number = song_choice.to_i
      song_number = song_number - 1
      puts "Playing " + list[song_number].name + " by " + list[song_number].artist.name
    end


  end



end


