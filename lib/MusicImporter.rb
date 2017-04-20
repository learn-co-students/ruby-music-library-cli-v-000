class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    #come cercare tutti file nella directory ed esporli
    Dir.glob("#{@path}/*.mp3").select{ |f| File.file?(f) }.map{ |f| File.basename f }
  end


  def import
    self.files.each{|filename| Song.create_from_filename(filename) }
  end
end
