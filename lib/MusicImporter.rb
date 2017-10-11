require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
  end

  def files
   @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def self.import
   files.each{|f| find_or_create_by_filename(f)}
  end

end
