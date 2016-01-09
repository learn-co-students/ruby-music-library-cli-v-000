class MusicImporter
  attr_reader :path, :files

  def initialize(file_path)
    @path = file_path
    @files = Dir["#{@path}/*.mp3"].map { |file| file.split("/").last }
    @library = []
  end

  def import
    @files.each { |file| @library << Song.create_from_filename(file) }
  end

  def files
    @files
  end
end