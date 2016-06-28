class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select do |file|
      !File.directory? file
    end
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
