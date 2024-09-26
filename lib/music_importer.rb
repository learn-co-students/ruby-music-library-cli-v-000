# require 'pry'
# class MusicImporter
#
# attr_accessor :path
#
# @@all = []
#   def initialize(path)
#     @path = path
#     # "./spec/fixtures/mp3s"
#     #binding.pry
#   end
#
#   def files
#     #binding.pry
#     Dir.entries("./spec/fixtures/mp3s").select {|f| !File.directory? f}
#
#   end
#
#   def import
#     #binding.pry
#     files.each{|file_name| Song.create_from_filename(file_name)}
#     # Song.create_from_filename(file_name)
#   end
# end
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{ |f| Song.create_from_filename(f) }
  end
end
