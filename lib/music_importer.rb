class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    unnormalized_files = Dir[self.path + "/*"]
    unnormalized_files.collect do |file|
      File.basename(file)
    end
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
