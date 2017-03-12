class MusicImporter
  #attributes & variables
  attr_accessor :path, :files

  #Modules

  #initialize
  def initialize(path)
    @path = path
  end

  #class methods

  #instance methods
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{|f| Song.create_from_filename(f)}
  end

end
