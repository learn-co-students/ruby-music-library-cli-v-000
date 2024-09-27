require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    filenames = Dir.entries(path)
    filenames.select do |file|
      if file.include?(".mp3")
        file.gsub("#{path}/", "")
      end
    end
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
