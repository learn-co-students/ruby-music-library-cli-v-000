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
    all_files = self.files
    all_files.each { |file| }......
  end

end
