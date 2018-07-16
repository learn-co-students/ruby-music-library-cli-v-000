require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end


  def files
    @array = Dir.glob("#{@path}/*.mp3").collect do |songname| #turn path into string
      File.basename(songname)
    end

  end

  def import
    self.files.each do |isong|
      Song.create_from_filename(isong)
    end
  end


end
