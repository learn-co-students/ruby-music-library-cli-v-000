require'pry'

class MusicLibraryController

  def initialize(path='./db/mp3s')
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
    user_input=gets.strip
    case user_input
    when "list songs"
      list_songs
    when"list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
    when "play song"
      play_song
    when "exit"
      return "Thank you!"
    else
      self.call
    end
  end

  def list_songs
    list = Song.all.sort_by!{|song| song.name}
    list.each{|element| puts "#{list.index(element)+1}. #{element.artist.name} - #{element.name} - #{element.genre.name}"}
  end

  def list_artists
    artist_list = Artist.all.sort_by{|artist| artist.name}
    artist_list.each{|element| puts"#{artist_list.index(element)+1}. #{element.name}"}
  end

  def list_genres
    genre_list = Genre.all.sort_by{|genre| genre.name}
    genre_list.each{|element| puts"#{genre_list.index(element)+1}. #{element.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name=gets.strip
    artist=Artist.find_or_create_by_name(artist_name)
    songs_by_artist_list = artist.songs.sort_by!{|song| song.name}
    songs_by_artist_list.each{|element| puts "#{songs_by_artist_list.index(element)+1}. #{element.name} - #{element.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name=gets.strip
    genre=Genre.find_or_create_by_name(genre_name)
    songs_by_genre_list = genre.songs.sort_by!{|song| song.name}
    songs_by_genre_list.each{|element| puts "#{songs_by_genre_list.index(element)+1}. #{element.artist.name} - #{element.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    number= gets.strip.to_i
    list = Song.all.sort_by!{|song| song.name}
    puts "Playing #{list[number-1].name} by #{list[number-1].artist.name}" unless number<1||number>list.size
  end
end
