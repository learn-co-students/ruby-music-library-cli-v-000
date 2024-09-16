require 'pry'
class MusicLibraryController
  attr_accessor :path, :command, :numsongs
  #command = nil
  @@song_num_list = []
  @@song_title_alp = []

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    command = 0
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    while command != "exit"
      puts "What would you like to do?"
      command = gets.strip
      case command
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    #use the song_list to get and sort all songs
    #song_list = Song.all.map{ |song| song.name}
    #song_alpha = song_list.sort
    #use the path to get a listing of all of the songs
    long_song_list = Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/","")}
    song_title = long_song_list.map{|title| title.gsub(".mp3", "")}
    #match the song name with element in filename
    #long_song_list.each do |song|
      #binding.pry
    #  song_alpha.find {|title|
    #    title.include?"song"
    #      song_array << title.gsub(".mp3", "")
    #    }
    #    song_array
    #end
    @@song_title_alp = song_title.sort_by {|title| title.scan(/-([^>]*)-/)}
    #add in index and puts it
    @@song_num_list = @@song_title_alp.map.with_index{ |song, i| "#{i+=1}. #{song}"}
    @@song_num_list.each {|title| puts title}
    #song_list.sort.map.with_index{ |song, i| puts "#{i+=1}. #{song}"}
    #artist_name, name, genre_name = filename.split(" - ")
    #artist = Artist.find_or_create_by_name(artist_name)
    #genre = Genre.find_or_create_by_name(genre_name.gsub(".mp3", ""))
    #split titles and assign to artist, genre, etc
    #long_song_list.each {|title| artist_name, name, genre_name = title.split(" - ")}
    #sort by song name

    #sort things by song name (everything after the first " - ")
    #long_song_list.sort_by {|song| song.split(' - ')}
    #add index and puts it
  end

  def list_artists
    #Artist.all.map.with_index{ |artist, i| artist.sort puts "#{i+=1}. #{artist.name}"}
    artist_list = Artist.all.map{ |artist| artist.name}
    artist_alpha = artist_list.sort
    artist_alpha.map.with_index{ |artist, i| puts "#{i+=1}. #{artist}"}
  end

  def list_genres
    genre_list = Genre.all.map{ |genre| genre.name}
    genre_alpha = genre_list.sort
    genre_alpha.map.with_index{ |genre, i| puts "#{i+=1}. #{genre}"}
  end

  def list_songs_by_artist()
    puts "Please enter the name of an artist:"
    command = gets.strip
    MusicLibraryController.new
    long_song_list = Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/","")}
    long_song_list << "Real Estate - Wonder Years - dream pop.mp3"
    title = long_song_list.map{|title| title.gsub(".mp3", "")}
    artist_name = []
    name = []
    genre_name = []
    #Song.create_from_filename("Real Estate - Wonder Years - dream pop.mp3")
    title.each {|title| artist_name << title.split(" - ").first}
    if  artist_name.include?(command) != true
    else
      artist = title.find_all{|title| title.split(" - ").first == command}
      artist_list = artist.map{|title| title.gsub("#{command} - ", "")}
      artist_list.sort.map.with_index{ |song, i| puts "#{i+=1}. #{song}"}
    end
  end

  def list_songs_by_genre()
    puts "Please enter the name of a genre:"
    command = gets.strip
    long_song_list = Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/","")}
    title = long_song_list.map{|title| title.gsub(".mp3", "")}
    genre_name = []
    title.each {|title| genre_name << title.split(" - ").last}
    if  genre_name.include?(command) != true
    else
      genre = title.find_all{|title| title.split(" - ").last == command}
      genre_list = genre.map{|title| title.gsub(" - #{command}", "")}
      genre_list.map.with_index{ |song, i| puts "#{i+=1}. #{song}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    command = gets.strip
    max_song = @@song_num_list.count
    if command.to_i >=1 && command.to_i <= max_song
      long_song_list = Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/","")}
      song_title = long_song_list.map{|title| title.gsub(".mp3", "")}
      @@song_title_alp = song_title.sort_by {|title| title.scan(/-([^>]*)-/)}
      #add in index and puts it
      @@song_num_list = @@song_title_alp.map.with_index{ |song, i| "#{i+=1}. #{song}"}
      #song_to_play_list = list_songs.song_title_alp.map.with_index{ |song, i| "#{i+=1}. #{song}"}
      song_to_play = @@song_num_list.find{|title| title.split(".").first == command}
      song_to_play_short = song_to_play[3..-1]
      artist_name, name, genre_name = song_to_play_short.split(" - ")
      puts "Playing #{name} by #{artist_name}"
    else
    end
  end
end
