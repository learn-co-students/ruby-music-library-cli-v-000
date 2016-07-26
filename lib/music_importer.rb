require 'pry'

class MusicImporter
  attr_reader :path
# initialize and accepts file path of mp3 files
  def initialize(path)
    @path = path
  end
# returns all of the filenames
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
  end

  def import
    self.files.each {|f| Song.new_from_filename(f)}
  end

end
