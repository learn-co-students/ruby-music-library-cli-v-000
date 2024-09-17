require 'pry'
class MusicImporter
  #solves uninitalize constant MP3Importer error
  def path=(path)#setter method
    @path = path
    #binding.pry
  end
  def path#getter method
    @path
  end
  def initialize(path)
    @path = path
  end
  def files
    Dir.glob("#{path}/*.mp3").collect do |file|
      file.gsub("#{path}/","")#ormalizes the filename to just the mp3 filename with no path
    end
  end
  def import
    files.sort.each do |song|
      Song.create_from_filename(song)
    end
  end
end
