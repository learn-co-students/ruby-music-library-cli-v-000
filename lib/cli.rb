class CLI
  attr_accessor :music_importer, :files

  def initialize(path="./db/mp3s/.")
    @music_importer=MusicImporter.new(path)
    @music_importer.import
  end

  def list_files()
    @files
  end

  #def list_songs
  #  i=1
  #  @music_importer.files.collect do |file|
  #    puts "#{i}. #{file}"
  #    i+=1
  #  end
  #end


  def list_songs
    songs= @files.collect{|filename|
      filename.split(/\s-\s/)[1]}.sort
      puts "Songs! #{songs}"

    songs.each_with_index do |insex,song|
      puts "#{index}. #{song}"
      songs
    end

  end

  def list_artists
  end

end
