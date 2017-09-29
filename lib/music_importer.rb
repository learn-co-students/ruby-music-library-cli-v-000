require 'pry'

class MusicImporter

  attr_accessor :path, :files


  def initialize(path)
    @path = path
  end


  def files
    files = Dir.glob("#{path}/*.mp3").collect do |file|
      file.gsub("./spec/fixtures/mp3s/", "")
    end
  end


  def import
    self.files.each {|file| Song.new_from_filename(file)}
  end

end


