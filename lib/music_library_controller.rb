require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your Music Library CLI! To begin, please enter a command: "
    user_input = gets.chomp.downcase

    case user_input
    when "exit"
      puts "Thank you for using our app!"
    when "list songs"
      self.list_songs
      self.call
    when "list artists"
      self.list_artists
      self.call
    when "list genres"
      self.list_genres
      self.call
    when "play song"
      self.list_songs
      puts "Please enter the number of the song you want to listen to:"
      song_number = gets.chomp.to_i - 1
      user_choice = Song.all[song_number]
      puts "Playing #{user_choice.artist.name} - #{user_choice.name} - #{user_choice.genre.name}"
      self.call
    when "list artist"
      puts "Please enter an artist whose songs you wish to see:"
      artist = gets.chomp
      found_artist = Artist.find_by_name(artist)

      found_artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end

      self.call
    when "list genre"
      puts "Please enter a genre whose songs you wish to see:"
      genre = gets.chomp
      found_genre = Genre.find_by_name(genre)

      found_genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end

      self.call
    else
      self.call
    end
  end

  def list_songs
    Song.all.sort_by!{|a| a.artist.name}.each_with_index{|s, index| puts "#{index + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end

  def list_artists
    Artist.all.sort_by!{|artist| artist.name}.each{|artist| puts artist.name}
  end

  def list_genres
    Genre.all.sort_by!{|genre| genre.name}.each{|genre| puts genre.name}
  end
end
