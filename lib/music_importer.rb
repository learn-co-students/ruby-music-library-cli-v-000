require 'pry'
class MusicImporter
  attr_reader :path
  attr_accessor :file_names

  def initialize(path)
    @path = path
  end

  def files
    @file_names = Dir["#{path}/*.mp3"]
    @file_names.map { | file_name | file_name.sub("#{path}/", "") }
  end

  def import
    files.each { | file_name | Song.create_from_filename(file_name) }
  end
end
