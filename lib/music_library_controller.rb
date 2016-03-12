class MusicLibraryController
  attr_accessor :song_list

  def initialize(path='./db/mp3s')
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import

    @song_list = Hash.new
    Song.all.each_with_index do |song, index|
      song_name = song.name
      song_artist = song.artist.name
      song_genre = song.genre.name
      song_list[index+1] = { name: song.name,
                           artist: song.artist.name,
                           genre: song.genre.name }
    end
  end

  def call
    while (input = gets.chomp) != 'exit'
      case input.downcase
      when 'list songs'
        Song.print_songs
      when 'list artists'
        Artist.all.each do |artist|
          puts artist.name
        end
      when 'list genres'
        Genre.all.each do |genre|
          puts genre.name
        end
      when 'play song'
        selection = song_list[gets.chomp.to_i]
        puts "Playing #{selection[:artist]} - #{selection[:name]} - #{selection[:genre]}"
        puts selection
      when 'list artist'
        selection = gets.chomp
        artist = Artist.find_by_name(selection)
        artist.songs.each do |song|
          puts "#{artist.name} - #{song.name} - #{song.genre.name}"
        end
      when 'list genre'
        selection = gets.chomp
        genre = Genre.find_by_name(selection)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end 
    end
  end
end
