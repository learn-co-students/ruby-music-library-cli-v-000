class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
     Dir.entries(path).select{ |file| file.end_with?(".mp3") }
  end

  def import # impports files into library by invoking Song.create_from_filename
    files.each { |file| Song.create_from_filename(file) }
  end   

end
