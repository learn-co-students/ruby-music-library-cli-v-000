
class MusicImporter

  def initialize(file_path)
    @path = file_path
  end

  def path
    @path
  end

  def files
    @files = Dir.entries(self.path).select {|file| file.include? "mp3"}
  end

end
