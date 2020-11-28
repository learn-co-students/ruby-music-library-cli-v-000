require 'pry'

class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    files = Dir[@path + "/**/*.mp3"]
    files.map! {|file| file.gsub(@path + "/","")}
    files.each {|file| @files << file unless @files.include?(file)}
    @files
  end

  def import
    files
    @files.each {|file| Song.create_from_filename(file)}
  end

end
