require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).reject do |files|
     !files.include?("mp3")
   end
  end

  def import
      self.files.each do |files|
        Song.create_from_filename(files)
     end
    end

end
