class MusicLibraryController
  attr_accessor :path, :imported

  def initialize(path = "./db/mp3s")
    @path = path
    @imported = MusicImporter.new(@path)
    @imported.import
  end

  #this is where your inputs come in"
  #valid inputs include: list songs, list artists, list genres, play song, list artist, list genre, exit
  def call
    input = ""
    while input != "exit"
      puts "What do you want to do? "
      input = gets.strip

      if input == "list songs"
        counter = 0
        self.imported.files.sort.each do |filename|
          counter += 1
          puts "#{counter}. #{filename}"
        end
      elsif input == "list artists"
        Artist.all.each do |artist|
          puts artist.name
        end
      elsif input == "list genres"
        Genre.all.each do |genre|
          puts genre.name
        end
      elsif input == "play song"
        puts "Which song?"
        number = gets.strip.to_i
        song = Song.all[number-1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      elsif input == "list artist"
        puts "Which artists songs?"
        artist_name = gets.strip
        Artist.find_by_name(artist_name).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      elsif input == "list genre"
        puts "Which genres songs?"
        genre_name = gets.strip
        Genre.find_by_name(genre_name).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end
end
