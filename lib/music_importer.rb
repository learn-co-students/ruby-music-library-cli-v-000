class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    all_files = Dir.entries(@path)
    all_files.delete_if {|file| !file.end_with? ".mp3"}
    all_files
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename) }
  end

end
