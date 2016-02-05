require 'pry'

class MusicImporter

  attr_accessor :path


  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{path}/*.mp3").collect{|song| song.gsub("./spec/fixtures/mp3s/", "")}
    #binding.pry
  end

  def import
    self.files.each{|filename| Song.new_from_filename(filename)}
  end

  
    



end