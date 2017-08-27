require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    Dir.glob("#{path}/*mp3").collect{|file| file.gsub("#{path}/", "")}
  end
  def import
    self.files.each do |file_path|
      Song.create_from_filename(file_path)
    end
  end
end
#file = "/home/usr/my_file.xml"
#File.basename(file,File.extname(file)) # => "my_file"
#example of file name format: Real Estate - It's Real - hip-hop.mp3
