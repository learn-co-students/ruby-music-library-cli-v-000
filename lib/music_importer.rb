class MusicImporter

attr_accessor :path, :files


  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path)
    @files.delete_if{|file| file == "." || file == ".."}

  end

  def import
    self.files
    @files.each {|filename| Song.create_from_filename(filename)}
  end
end
