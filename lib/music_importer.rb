class MusicImporter
  
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end
  
  def files
    Dir["#{@path}/*.mp3"].sort.each do |file|
      @files << File.basename(file)
    end
    @files
  end
  
  def import
    self.files.each{|file_name| Song.create_from_filename(file_name)}
  end
    
end