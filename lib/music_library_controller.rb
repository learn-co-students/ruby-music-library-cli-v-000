
class MusicLibraryController
  #accepts one argument, the path to the MP3 files to be imported
  #creates a new MusicImporter object, passing in the 'path' value
  #the 'path' argument defaults to './db/mp3s'
  #invokes the #import method on the created MusicImporter object
  def initialize(path= './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end


end
