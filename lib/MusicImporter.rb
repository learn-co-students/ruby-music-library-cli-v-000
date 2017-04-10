require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path='./db/mp3s')
    @path=path
  end

  def files
    filenames = Dir["#{self.path}/*.mp3"]
    normalnames=[]
    filenames.collect do |filename|
      normalnames << filename.split("/")[filename.split("/").size-1]
    end
    return normalnames.sort
  end

  def import
    files.each do |file_name| Song.create_from_filename(file_name)
    end
  end



end
