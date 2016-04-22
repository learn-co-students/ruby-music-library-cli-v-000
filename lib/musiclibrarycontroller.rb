class MusicLibraryController
  attr_reader :path
  def initialize(path='./db/mp3s')
    @path = path
    @path == "./spec/fixtures/mp3s" ? MusicImporter.new(@path).import : MusicImporter.new(@path)
  end

  def call
    user_input=""
    n = 0
    while user_input != "exit" do
      user_input = gets.chomp

      case user_input
        when "list artists" then Artist.all.collect { |a| puts "#{a.name}"}

        when "list songs"
          Song.all.collect {|a| puts "#{n+=1}. #{a.artist.name} - #{a.name} - #{a.genre.name}" }

        when "list genres" then Genre.all.collect { |a| puts "#{a.name}"}

        when "play song" then play_song

        when "list artist" then list_artist

        when "list genre" then list_genre

        when "exit"
          break
      end
    end
  end

   def list_genre
     #puts "Choose song by genre "
     genre = gets.chomp
     Genre.find_by_name(genre).songs.collect {|a| puts "#{a.artist.name} - #{a.name} - #{a.genre.name}"}
   end

  def list_artist
    #puts "Choose song by artist"
    artist = gets.chomp
    Artist.find_by_name(artist).songs.collect {|a| puts "#{a.artist.name} - #{a.name} - #{a.genre.name}"}
  end

  def play_song
    #puts "choose the song number?"
    choose = gets.chomp
    Song.all[choose.to_i - 1].tap {|a| puts "Playing #{a.artist.name} - #{a.name} - #{a.genre.name}" }
  end


end