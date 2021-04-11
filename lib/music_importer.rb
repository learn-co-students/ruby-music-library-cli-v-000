class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    #collects files that aren't sub-directories or "." and ".." folders
    Dir.entries(@path).select {|f| !File.directory? f}
  end

  #imports songs from a file into the library
  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end
