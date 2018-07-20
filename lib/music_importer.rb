class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    files = Dir.entries(@path)
    files[2..-1]
    # .map {|file| file[0..-5].split(" - ")}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end
