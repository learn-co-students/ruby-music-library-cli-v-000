class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*").select {|x| File.file? x}.collect {|f| File.basename f}
  end

  def import
    self.files.each {|x| Song.create_from_filename(x)}
  end
end
