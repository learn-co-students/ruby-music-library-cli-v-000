class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    list_of_file_names = Dir.entries(@path).select do |file|
      !File.directory?(file)
    end
    list_of_file_names
  end

  def import
    self.files.collect do |file|
      song = Song.create_from_filename(file)
      song
    end
  end
end
