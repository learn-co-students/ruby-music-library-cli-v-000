class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end
  def files
    path = Dir.pwd
    Dir.entries(@path).select{ |file| file.end_with?("mp3")  }
    
  end

  def import
  files.select{|files| Song.create_from_filename(files)}
    
  end

end