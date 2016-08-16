require 'pry'
class MusicImporter
attr_accessor :path, :files

  def initialize(file_path)
    @path = file_path
     @files = Dir.entries(file_path).reject{ |e| File.directory? e }
  end

  def import
    @files.each do |x|
    Song.create_from_filename(x)
    end
  end

end

