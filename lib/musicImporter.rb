require 'pry'
class MusicImporter
   attr_reader :path
   def initialize(path)
      @path = path
      # @files = []
   end

   def files
      @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
   end

   def import
      myFiles = files
      myFiles.each {|file| Song.create_from_filename(file)}
   end


end