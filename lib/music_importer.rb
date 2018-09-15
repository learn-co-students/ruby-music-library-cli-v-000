class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
      #entries method: Returns an array containing all of the filenames in the given directory.
    @files ||= Dir.entries(@path).select {|filename| !File.directory?(filename) && filename.end_with?(".mp3")}
      # using song instead of (filename) and filename.end_with... like in collaborating objects lab did not work
      # directory is another name for a folder, and we're not looking for folders, only file names, and specifically file names that end with .mp3
  end

  def import
    filecollection.each {|song| Song.new_by_filename(song)}    #We're creating new instances of the Song class
      # files.each {|song| Song.new_by_filename(song)}
  end

end
