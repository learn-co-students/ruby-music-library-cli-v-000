class MusicImporter
  attr_reader :path, :files
  def initialize(path)
    @path=path
  end

  def files
    @files=Dir.entries(path).select do |file|
      file.include?(".mp3")
    end
  end

  def import 
    self.files.collect do |file|
      Song.create_from_filename(file)
    end
  end
end

