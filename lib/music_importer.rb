require 'pry'
class MusicImporter
  attr_reader :path
  attr_accessor :file_names

  def initialize(path)
    @path = path
  end

  def files
    @file_names = Dir["#{path}/*.mp3"]
    @file_names = @file_names.map { | file_name | file_name.sub("#{path}/", "") }
    @file_names
  end

  def import
    files
    @file_names.each { | file_name | Song.create_from_filename(file_name) }
  end
end
