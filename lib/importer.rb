class MusicImporter

  attr_accessor :path, :filenames

  def initialize(file_path)
    @path = file_path
  end

  def files
    @filenames = Dir.entries(@path).delete_if {|file| file.include?(".mp3") == false}.collect {|file|
      File.basename(file)}
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
