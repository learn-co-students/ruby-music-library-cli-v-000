class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{path}/*.mp3")
    files.map { |file| file.split('/').last }
  end

  def import
    library = self.files
    library.each { |file_name| Song.create_from_filename(file_name) }
  end
end
