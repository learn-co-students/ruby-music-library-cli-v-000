class MusicLibraryController
  attr_accessor :path, :music_importer, :files

  def initialize(path='./db/mp3s')
    @path=path
    @music_importer=MusicImporter.new(path)
  end

  def list_songs
    i=1
    @music_importer.files.collect do |file|
      puts "#{i}. #{file}"
      i+=1
    end
  end

  def list_artists
  end

end
