class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(path).sort.select do |file|
      !file.start_with?(".")
    end
    files#.sort_by { |x| File.ctime(x) }
  end

  def import
    files.map do |file|
      Song.create_from_filename(file)
    end
  end

end
