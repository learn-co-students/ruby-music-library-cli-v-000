require './config/environment.rb'
require 'pry'

class MusicImporter
  
  include Concerns::MLInit
  attr_accessor :path, :files
  
  def files
    self.files = Dir.entries(self.path).select{|f| f.include?(".mp3")}
  end
  
  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end
  
end
