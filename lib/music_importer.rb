  #  require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select { |file| file.end_with?(".mp3")}
  end

  def self.import

  end

end
