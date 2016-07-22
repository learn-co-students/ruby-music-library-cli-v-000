require "pry"
class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(path) #put the list of files in the files directory!
    files.delete_if do |file| #iterate and delete if there are any ".." or "."
      file == ".." || file =="."
    end
  end

  # imports the files into the library by creating songs from a filename
  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end


end
