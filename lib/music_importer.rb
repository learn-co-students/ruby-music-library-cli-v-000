require 'pry'
class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{self.path}/*mp3") #sets files array equal to the files with mp3
    @files = @files.collect{|x| x.gsub("#{path}/", "")} #removes the path from the files so it returns just the artist/song info
    # binding.pry
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
