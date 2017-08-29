class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[@path + "/*"].collect {|file| File.basename(file)}
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end