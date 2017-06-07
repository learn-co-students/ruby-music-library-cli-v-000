class MusicImporter

  attr_accessor :path, :file_names

  def initialize(file_path)
    @path = file_path
  end

  def files
    @file_names = Dir.entries(@path).delete_if {|file| file.include?(".mp3") == false}.collect {|file|
      File.basename(file)}
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
