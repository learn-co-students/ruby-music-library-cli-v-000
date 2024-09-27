class MusicImporter

  #path retrieves the path provided to the MusicImporter object

  attr_accessor :path

  #initialize accepts a file path to parse MP3 files from

  def initialize(path)
    @path = path
  end

  def files
    @files = []
    Dir.foreach(self.path) {|song| @files << song if song.include? ".mp3"}
    @files
  end

  def import
    files.each { |filename| Song.create_from_filename(filename)}
  end

end
