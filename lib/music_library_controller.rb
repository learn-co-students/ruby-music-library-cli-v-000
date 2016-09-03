class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    puts "Welcome to the Music Library"
    while input != "exit" do
      puts "How can I help you?"
      input = gets.strip
      if input == "list songs"
        Song.all.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      elsif input == "list artists"
        Artist.all.each {|artist| puts "#{artist.name}"}
      elsif input == "list genres"
        Genre.all.each {|genre| puts "#{genre.name}"}
      elsif input == "play song"
        Song.all.each {|song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      elsif input == "list artist"
        puts "Which artist's songs would you like to see?"
        name = gets.strip
        artist = Artist.find_by_name(name)
        if artist != nil
          artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
        else
          puts "We don't have any artists with that name."
        end
      elsif input == "list genre"
        puts "Which genre's songs would you like to see?"
        name = gets.strip
        genre = Genre.find_by_name(name)
        if genre != nil
          genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
        else
          puts "We don't have any genres with that name."
        end
      end
    end
  end
end
