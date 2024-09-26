class MusicImporter

  attr_accessor :path, :files

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files = Dir.foreach(path).select do |x|
      File.file?("#{path}/#{x}")
    end
  end

  def import
    self.files
    if @files
      @files.each do |file|
        Song.create_from_filename(file)
      end
    end
  end
end
