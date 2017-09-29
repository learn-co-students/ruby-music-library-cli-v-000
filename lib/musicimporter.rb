class MusicImporter

  attr_accessor :path, :files

  def initialize(path) 
    #where path is the file path for mp3 files
    @path = path
  end

  def files
    @files = Dir["#{@path}/*.mp3"].collect{|filename| filename.split("/").last}
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end