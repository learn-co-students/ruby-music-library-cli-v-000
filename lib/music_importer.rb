class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end

  def files
    # Dir.entries(self.path).map do |file|
    #   file.match(/^.+\.mp3$/) ? file : nil
    # end.compact 

    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
  end

  def import
    # self.files.each do |filename|
    #   artist, song, genre = filename.split(" - ")
      
    #   new_song = Song.find_or_create_by_name(song)
    #   new_song.artist = Artist.find_or_create_by_name(artist)
    #   new_song.genre = Genre.find_or_create_by_name(genre.gsub(/\.mp3/, ""))

    files.each{|f| Song.create_from_filename(f)}
  end

end