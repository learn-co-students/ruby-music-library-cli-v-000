class MusicImporter
  attr_accessor :path

  def files
    Dir[File.join(@path, '*.mp3')].map do |file|
      File.basename file
    end
  end
  
  def initialize(path)
    @path = path
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end
end