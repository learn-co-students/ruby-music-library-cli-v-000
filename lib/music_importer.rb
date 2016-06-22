require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir[@path + "/*.mp3"].each do |mp3|
      mp3.slice!(/.+\//)
      files << mp3
    end
    files
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end