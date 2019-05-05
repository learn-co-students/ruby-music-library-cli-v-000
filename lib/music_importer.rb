require 'pry'

class MusicImporter
  attr_accessor :filenames, :path

  def initialize(path)
    @path = path
    @filenames = []
  end

  def files
     @filenames = Dir.entries(path).select{|file| file.include?(".mp3")}
   end


   def import
      files
      @filenames.each{|song| Song.create_from_filename(song)}
    end

end
