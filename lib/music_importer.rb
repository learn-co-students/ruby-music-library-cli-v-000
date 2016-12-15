class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path)
    @files_normalized = @files.keep_if {|file| file != "." && file != ".."}
    @files_normalized
  end

  def import
    files.each {|file| song = Song.new_by_filename(file)}
  end


end