class MusicImporter
  attr_accessor :file_path

  def initialize(file_path)
    @path = file_path
  end

  def path
    @path
  end

  def files
    @files = []

    Dir["#{@path}/*"].each do |file|
      file_name = file.split("mp3s/")[1]
      @files << file_name
    end

    @files
  end

  def import
    files = self.files
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
