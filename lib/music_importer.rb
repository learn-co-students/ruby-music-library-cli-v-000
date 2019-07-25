require 'pry'
class MusicImporter

  attr_reader :path, :filename

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select {|f| !File.directory? f}
    # binding.pry
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
    # binding.pry
  end
end



  # def import
  #   #  4.times {Song.new_by_filename(file_name)} "this works but hardcoded to 4 times"
  #   files.each {|filename| Song.new_by_filename(filename)}
  # end
