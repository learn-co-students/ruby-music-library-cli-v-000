require 'pry'
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
    @files = []
  end

  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end

  def files
    @files = Dir["#{@path}/*.mp3"].collect {|filename| filename.sub!("#{@path}/", "")}
  end


end
