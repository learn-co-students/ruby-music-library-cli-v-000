# require 'pry'
class MusicImporter
  attr_accessor :path, :files, :song
  def initialize(path)
    @path = path
  end

  def files
    # binding.pry
    Dir.entries("#{path}").select{|filename| filename.include?("mp3")}
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
# binding.pry
