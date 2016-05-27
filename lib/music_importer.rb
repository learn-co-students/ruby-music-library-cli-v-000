class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    list_of_files = Dir.glob("#{path}/*")
    list_of_files.collect do |file|
      file.split("/").last
    end
  end

  def import
    self.files.collect do |file|
      Song.create_from_filename(file)
    end
  end

end
