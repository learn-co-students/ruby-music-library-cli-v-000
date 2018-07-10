class MusicImporter

  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    files = Dir[self.path + "/*"]
    files.map{|file| file.split("/").last}
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
