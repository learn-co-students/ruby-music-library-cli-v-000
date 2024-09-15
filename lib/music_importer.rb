class MusicImporter
  
  attr_accessor :path 

  def initialize(path)
    @path = path
  end

  def files
    mp3_files = []
    Dir.foreach(@path) do |filename| 
      if filename.include?(".mp3")
        mp3_files << filename
      end
    end
    mp3_files
  end

  def import
    files.each {|file_name| Song.create_from_filename(file_name)}
  end



end
