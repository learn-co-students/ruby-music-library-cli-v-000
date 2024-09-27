class MusicLibraryController
  

  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.files
    @importer.import
  end

  def call
    input = nil
    while input != "exit"
      puts "Would you like to: 'list songs', 'list artists', or 'list genres', 'play song', 'list artist', or 'list genre'?"
      input = gets.chomp

      case input
      when "list songs"
        list_count = 1
        @importer.files.each do |filename|
          puts "#{list_count}. #{filename.chomp("mp3")}"
          list_count += 1
        end
      when "list artists"
        Artist.all.each { |artist| puts artist.name }
      when "list genres"
        Genre.all.each { |genre| puts genre.name }
      when "play song"
        list_count = 1
        @importer.files.each do |filename|
          puts "#{list_count}. #{filename.chomp("mp3")}"
          list_count += 1
        end
        puts "Which song would you like to play?"
        song_number = gets.chomp.to_i
        list_count = 1
        @importer.files.each do |filename|
          puts "Playing #{filename.chomp("mp3")}" if list_count == song_number
          list_count += 1
        end
      when "list artist"
        puts "Whose songs would you like to view (enter artist name)?"
        artist = gets.chomp
        Artist.find_by_name(artist).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list genre"
        puts "Which genre would you like to explore?"
        genre = gets.chomp
        Genre.find_by_name(genre).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end
end