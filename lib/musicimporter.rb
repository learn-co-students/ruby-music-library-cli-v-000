class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    files = Dir.foreach(@path).select { |x| File.file?("#{@path}/#{x}") }
    files
  end
  
  def import
    files = Dir.foreach(@path).select { |x| File.file?("#{@path}/#{x}") }
    files.each {|filename| Song.create_from_filename(filename) }
  end
  
end