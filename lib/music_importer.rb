class MusicImporter 
  require 'pry'
  attr_reader :path
  
  
  def initialize(path)
    @path = path
  end
  
  def files
    # binding.pry
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |x| x.gsub("#{path}/", "")}
  end
  
  def import(file)
    files.each { |s| Song.create_from_filename(s)}
  end
  
  
  
end