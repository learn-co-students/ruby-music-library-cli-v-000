require 'pry'

class MusicImporter
attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select{|i| i.split(".")[-1] == "mp3"}
  end

  def import
    self.files.each do |el|
      Song.create_from_filename(el)
    end
  end
end
