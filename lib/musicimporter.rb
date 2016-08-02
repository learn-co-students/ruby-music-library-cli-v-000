class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files

    Dir.glob(File.join(@path, '*.mp3')).each do |file|
      file = file.split("/")[4]
      files << file
    end
    
    @files
  end

  def import
    @files.each do |file|
      Song.create_from_filename(file)
    end
  end
end