class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files = Dir[path + "/*"]
    @files.each_with_index do |file, index|
      @files[index] = file.split("/")[-1]
    end
    @files
  end
  
  def import
    files.collect do |file|
      song = Song.create_from_filename(file)
    end
  end
  
end