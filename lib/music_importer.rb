class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select do |file|
      file.end_with?("mp3")
    end
  end

  def import
    files.each { |name| Song.create_from_filename(name) }
  end

end