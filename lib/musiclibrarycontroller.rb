class MusicLibraryController
  attr_accessor :path, :music_importer, :files

  def initialize(path='./db/mp3s')
    @path=path
    @music_importer=MusicImporter.new(path).import
  end

  def list_files
    i=1
    @music_importer.files.collect do |file|
      puts "#{i}. #{file}"
      i+=1
    end
  end

  def list_songs
    songs= @music_importer.files.collect{|filename|
      filename.split(@path)[1].split("/")[1] }.sort
    i=1
    songs.each do |song|
      puts "#{1}. #{song}"
      i+=1
    end

  end

  def list_artists
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    enter=gets
    while enter!='exit' do
      enter=gets
    end
  end

end
