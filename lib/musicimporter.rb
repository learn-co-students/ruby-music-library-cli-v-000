class MusicImporter
attr_accessor :path, :dir


  def initialize(path)
    @path = path
  end

  def files
    @dir = Dir["#{@path}/*.mp3"].select{ |f| File.file? f }.map{ |f| File.basename f } #thank you stack overflow, I know DOS why isn't there just a flag to exclude path?
    @dir
  end
  def files2
    #dir = Dir.entries("#{@path}").glob(*.mp3)
    Dir.chdir("#{@path}")
    dir = Dir.glob("*.mp3")
    dir
  end

  def self.import
    self.dir.each do |file|
      Song.create_from_filename(file)
    end
  end







end
