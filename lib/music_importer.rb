require 'pry'

class MusicImporter
  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    Dir.entries(@path).delete_if do |filename|
      filename.start_with? "."
    end
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end


end
