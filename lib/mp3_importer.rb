class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*.mp3")
    @all_files = @files.collect { |file| file.split("/")[4] }
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
