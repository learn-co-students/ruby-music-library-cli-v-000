class MusicLibraryController
  attr_accessor :path, :importer

  def initialize(path = './db/mp3s')
    @path = path
    @importer = import_music(path)
  end

  def import_music(path)
    music_importer = MusicImporter.new(path).import
    music_importer
  end

  def call
    input = @path
    until input == "exit"
      input = gets

      if input == "list songs"
        Song.all.sort{|a,b| a.artist.name <=> b.artist.name}.each_with_index{|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      elsif input == "list artists"
        Artist.all.each_with_index{|artist, i| puts "#{i+1}. #{artist.name}"}
      elsif input == "list genres"
        Genre.all.each_with_index{|genre, i| puts "#{genre.name}"}
      elsif input == "play song"
        puts "Which song?"
        song = Song.all[gets.to_i-1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      elsif
        if artist = Artist.find_by_name(input)
          artist.songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
        elsif genre = Genre.find_by_name(input)
          genre.songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
        end
      end
    end
  end
end
