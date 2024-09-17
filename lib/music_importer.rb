class MusicImporter

  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    Dir.entries(path).select { |file_name| file_name.include?(".mp3") }
  end

  def import
    file_names = self.files
    file_names.each { |file| Song.create_from_filename(file) }
  end
end
