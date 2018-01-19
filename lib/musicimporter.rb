# MusicImporter Class
#
# 
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob(@path + '/*mp3')
    files = files.collect do |file|
      file.gsub(@path + '/', '')
    end
    files
  end

  def import
    self.files.each do | filename |
      Song.create_from_filename(filename)
    end  
  end
  
    



end


