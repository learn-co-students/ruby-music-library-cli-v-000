class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Welcome to the Music Library CLI!"
    puts "Please type: list songs, list artist/s, list genre/s, or play song."
    puts "You may also search for a song, artist, or genre by typing out its name."
    puts "To leave the program, please type: exit."
    choice = nil
    while choice != "exit"
      choice = gets.chomp
      case choice
        when "list songs"
          Song.all.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
        when "list artists"
          Artist.all.each {|artist| puts "#{artist.name}"}
        when "list genres"
          Genre.all.each {|genre| puts "#{genre.name}"}
        when "play song"
          Song.all.each {|song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}
        when "list artist"
          Artist.all.each do |artist|
            artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
          end
        when "list genre"
          Genre.all.each do |genre|
            genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
          end
      end
    end
  end
end
