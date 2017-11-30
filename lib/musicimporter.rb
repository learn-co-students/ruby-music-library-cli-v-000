class MusicImporter
attr_accessor :path, :files
  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{@path}/*.mp3"].select{ |f| File.file? f }.map{ |f| File.basename f } #thank you stack overflow, I know DOS why isn't there just a flag to exclude path?
    #@dir
  end
#  def files2
    #dir = Dir.entries("#{@path}").glob(*.mp3)
#    Dir.chdir("#{@path}")
#    dir = Dir.glob("*.mp3")
#    dir
#  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
