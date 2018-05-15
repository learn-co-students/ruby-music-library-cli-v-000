class MusicImporter
  attr_accessor :path
  @@files = []

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/**/*").select { |e| File.file? e}.map{|f| File.basename f}
  end

  def import 
    files.each { |file| Song.create_from_filename(file)}
  end

end
