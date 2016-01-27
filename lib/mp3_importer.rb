require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").collect do |x|
      x.split('s/').last
    end
  end

  def import
    self.files.each{|file_name| Song.create_from_filename(file_name)}
  end
end