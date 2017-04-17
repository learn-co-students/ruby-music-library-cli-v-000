require 'pry'
class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path =path
  end

  def files
    #File.basename(file,File.extname(file)) => ()"Thundercat - For Love I Come - dance")
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| File.basename(f,".mp3") } #modified spec (deleted .mp3)
  end

  def import
    arr = []
    self.files.each do |file| song = Song.create_from_filename(file)
    arr << song
    end
    arr
  end
end
