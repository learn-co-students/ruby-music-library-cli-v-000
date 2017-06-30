class MusicImporter

  def initialize(path)
      @path = path
      @files = []
  end

  def path
    @path
  end

  def files
      files = Dir["#{@path}/*.mp3"]
      files.each do |file|
        @files << File.basename(file)
      end
      @files
  end


  def import
    self.files
    @files.each {|filename| Song.create_from_filename(filename) }
  end

end
