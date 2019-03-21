# The MP3 Importer will parse all the filenames in the db/mp3s folder and send the filenames to the Song class
class MusicImporter

  attr_accessor :path, :artist, :song, :genre

  def initialize(path)
    @path = path
  end

  # loads all the mp3 files in the path directory
  # normalizes the filename to just the mp3 filename with no path
  def files
    files = Dir["#{path}/*.mp3"].each {|file_name| next if File.directory? file_name}
    norm_files = files.collect {|filename| File.basename(filename)}
    norm_files
  end

  def path
    @path
  end

  # imports the files into the library by creating songs from a filename
  def import
    self.files.each{ |filename| Song.create_from_filename(filename) }
  end

end
