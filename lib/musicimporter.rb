class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    #Dir takes in file path and returns an array
    Dir["#{@path}/*.mp3"].collect {|file_name| file_name.gsub("#{@path}/", "")} #["Action Bronson - Larry Csonka - indie.mp3"]
  end

  def import
    files = self.files
    files.each {|file| Song.new_from_filename(file)}
  end

end
