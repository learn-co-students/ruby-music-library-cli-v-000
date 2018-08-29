class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end 
  
  def files
    Dir.entries(@path).select {|f| !File.directory? f}
  end
  
  def import
    files.collect do |file_name|
      Song.create_from_filename(file_name)
    end
  end 
  
end 