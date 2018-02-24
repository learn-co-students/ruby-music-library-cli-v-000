require 'pry'
class MusicImporter
  attr_accessor :path, :filenames
  def initialize(path)
    @path = path
  end
  def files
    Dir.entries("#{path}").select {|file| !File.directory? file}
    #File.directory? would reject non-regular files
  end
  def import
    #iterate over the files array and for each file create new song from the file name 
    files.collect{|file| Song.create_from_filename(file)}
  end
end
