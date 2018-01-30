class MusicLibraryController
  attr_reader :path

  def initialize(path='./db/mp3s')
    @path = path
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    begin
      print "Enter a command or exit: "
      input = gets.chomp
      case input
      when 'list artist'
        print "Enter an artist: "
        @importer.list_artist(gets.chomp)
      when 'list artists'
        @importer.list_artists
      when 'list genre'
        print "Enter a genre: "
        @importer.list_genre(gets.chomp)
      when 'list genres'
        @importer.list_genres
      when 'list songs'
        @importer.list_songs
      when 'play song'
        print "Enter a song number: "
        @importer.play_song(gets.chomp.to_i)
      when 'exit'
        puts 'Exiting...'
      else
        puts "Invalid input"
      end
    end while input != "exit"
  end
end
