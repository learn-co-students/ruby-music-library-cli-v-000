require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    files = MusicImporter.new(path)
    files.import
  end

  def call
    input = nil
    until input == "exit"
      input = gets.chomp #until input == "exit"
      case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "play song"
        puts "Please select song number."
        input = gets.chomp.to_i
        self.play_song(input)
      when "list artist"
        input = gets.chomp
        self.list_artist_songs(input)
      when "list genre"
        input = gets.chomp
        self.list_songs_via_genre(input)
      end
    end
  end

  def list_songs
    Song.collect_and_format_songs.each_with_index {|song, index| puts "#{index + 1}. " + song}
  end

  def list_artists
    Artist.all.map {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.map {|genre| puts "#{genre.name}"}
  end

  def play_song(input)
    song_to_be_played = Song.collect_and_format_songs[input - 1]
    puts "Playing " + song_to_be_played
  end

  def list_artist_songs(input)
    Song.collect_and_format_songs.each {|song| puts song if song.include?(input)}
  end

  def list_songs_via_genre(input)
    Song.collect_and_format_songs.each {|song| puts song if song.include?(input)}
  end































end
