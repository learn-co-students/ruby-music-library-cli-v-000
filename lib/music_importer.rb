class MusicImporter

  def initialize(path)
    @path = path
  end

  def path#path retrieves the path provided to the MusicImporter object
    #dir  = File.dirname(pn)     # "/usr/bin"
   MusicImporter.path = ("./spec/fixtures/mp3s")
  end

  def files
    #@files || = Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    #removes the actual path that is attached to filename and collects the filename only
  end

  def import
    files.each {|file| Song.new_from_filename(file)}
  end
end
