class MusicImporter
  attr_accessor :path
  @@files = []

  def initialize(path) # accepts a file path to a directory of mp3 filenames
    @path = path
  end

  def files #returns all of the imported filenames
    Dir.glob("#{path}/**/*").select { |e| File.file? e}.map{|f| File.basename f}
  end

  def import #imports all of the files from the library, instantiating a new Song object for each file.
    files.each { |file| Song.create_from_filename(file)}
  end

end
