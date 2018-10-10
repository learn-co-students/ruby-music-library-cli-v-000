
class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  # def files
  #   @files = Dir.glob("#{@path}/*.mp3")
  #   @files.collect do |file|
  #     file.gsub("#{path}/", "")
  #   end
  # end
  
  #Original #files above.  Had to redo to make import work.
  
  def files
    files = []
    Dir.glob("#{path}/*.mp3").collect do |file|
      files << file.gsub("#{path}/", "")
    end
    files
  end
  
  def import
    files.collect{|file| Song.create_from_filename(file)}
  end
  
end
