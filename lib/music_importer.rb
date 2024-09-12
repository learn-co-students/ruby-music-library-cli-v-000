class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    songs = Dir["#{@path}/*"]
    songs.collect {|file| file.split("/")[4]}
  end

  def import
      files.each {|files| Song.create_from_filename(files)}
  end




end
