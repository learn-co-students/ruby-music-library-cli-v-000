class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(@path)
    importer.import
  end

  def call
    puts "What would you like to do?"
    response = gets.chomp
    case response
    when "list songs"
      Song.all.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    when "list artists"
      Artist.all.each do |artist|
        puts artist.name
      end
    when "list genres"
      Genre.all.each do |genre|
        puts genre.name
      end
    when "play song"
      puts "What song number would you like to play?"
      song_num = gets.chomp.to_i - 1
      puts "Playing #{Song.all[song_num].artist.name} - #{Song.all[song_num].name} - #{Song.all[song_num].genre.name}"
    when "list artist"
      puts "What artist would you like to list?"
      artist_name = gets.chomp
      Artist.all.each do |artist|
        if artist.name == artist_name
          artist.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end
      end
    when "list genre"
      puts "What genre would you like to list?"
      genre_name = gets.chomp
      Genre.all.each do |genre|
        if genre.name == genre_name
          genre.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end
      end
    when "exit"
      return nil
    end
    self.call unless response == "exit"
  end
end