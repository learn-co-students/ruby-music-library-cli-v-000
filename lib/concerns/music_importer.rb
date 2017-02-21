require 'pry'
class MusicImporter < Song
  attr_reader :path, :filename
  #def initialize(path = "./db/mp3")
    #music_importer = self.new(path)
    #music_importer.import
  #end
  def initialize(path)
    @path = path
  end

  def files
    @files ||=
    Dir.glob("#{path}/*.mp3").collect{|f|
    f.gsub("#{path}/","")}
  end

#imports all the files from the library and creates the Song objects.
  def import
    files.each do |filename|
    Song.create_from_filename(filename)
    end
  end

end
