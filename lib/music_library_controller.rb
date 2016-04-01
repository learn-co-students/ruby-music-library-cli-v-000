class MusicLibraryController
  attr_accessor :path
  attr_reader :importer
  
  def initialize(path = './db/mp3s')
    @importer = MusicImporter.new(path).import
  end
  
  def call
    input = ""
    while input != "exit"
      puts "What would you like to do?"
      input = gets.chomp
      case input
      when "list songs"
        i = 1
        Song.all.each do |song| 
          puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
          i+=1
        end
      when "list artists"
        artist = Song.all.collect{|song| song.artist.name}.uniq
        artist.each{|artist| puts artist}
      when "list genres"
        genre = Song.all.collect{|song| song.genre.name}.uniq
        genre.each{|genre| puts genre}
      when "list artist"
        puts "Enter Artist Name:"
        target_artist = gets.chomp
        
        songs = Song.all.select{|song| song.artist.name == target_artist}
        songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list genre"
        puts "Enter Genre:"
        target_genre = gets.chomp
        
        songs = Song.all.select{|song| song.genre.name == target_genre}
        songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

      when "play song"
        puts "Select a song"
        song_num = gets.chomp
        song_num = song_num.to_i - 1
        puts "Playing #{Song.all[song_num].artist.name} - #{Song.all[song_num].name} - #{Song.all[song_num].genre.name}"
      end 
    end 
  end
end