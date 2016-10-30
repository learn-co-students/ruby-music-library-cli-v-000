require "pry"
class MusicImporter
  attr_accessor :files, :path

  def initialize(path)
    @path=path
    @files=Dir["#{path}/*"]  #pull all files
    @files=@files.collect{|file| file.sub("#{path}/","")}
  end

  def import
    @files.each{|file| Song.new_from_filename(file)}
  end
end
