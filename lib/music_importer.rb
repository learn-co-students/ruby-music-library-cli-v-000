require 'pry'
require_relative '../concerns/findable.rb'

class MusicImporter
  extend Concerns::Findable
  attr_accessor :path, :filename

  def initialize(path)
    @path = path
  end

   def files
     @file_array = Dir.entries(path).select{|file| file.include?(".mp3")}
   end
 
  def import(filename)
    Song.new_from_filename
  end

end