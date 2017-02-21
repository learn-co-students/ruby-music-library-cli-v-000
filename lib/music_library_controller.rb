

class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""
    song_list = Song.all.sort{|a,b| a.artist.name <=> b.artist.name}
    while input != "exit"
      input = gets.chomp
      case input
      when "list songs"
        song_list.each{|song| puts "#{song_list.index(song)+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}

      when "list artists"
        artist_list = Artist.all.map{|artist| artist.name}
        artist_list.each{|artist| puts artist}

      when "list genres"
        genre_list = Genre.all.map{|genre| genre.name}
        genre_list.each{|genre| puts genre}

      when "play song"
        input = gets.chomp.to_i
        song = song_list[input-1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"

      when Artist.find_by_name(input).name
        Artist.find_by_name(input).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end

    end
  end

end
