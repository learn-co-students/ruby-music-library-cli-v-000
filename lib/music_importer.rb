class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    result = []
    Dir.foreach(@path) do |file|
      if file.end_with?(".mp3")
       result << file
      end
    end
    result
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
