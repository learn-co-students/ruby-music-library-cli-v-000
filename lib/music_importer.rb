require 'pry'

class MusicImporter

  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    file_list = []
    Dir["#{@path}/*.mp3"].each do |fn|
      file_list << fn
    end
    file_list.map do |file|
      file.split(/\//)[-1]
    end

  end

  def import
    self.files.map do |a_file|
      a_file = Song.create_from_filename(a_file)
    end
  end

end
