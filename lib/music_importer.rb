require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*").collect do |file|
      file.split("/")[4]
    end
  end

  def import #imports the files into the library by invoking Song.create_from_filename
    files.each { |files| Song.create_from_filename(files) }
  end

end
