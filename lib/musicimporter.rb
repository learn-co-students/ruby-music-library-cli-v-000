require 'pry'
class MusicImporter

  def initialize(file_path)
    @path = file_path
  end

  def path
    @path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    self.files.collect {|each_file| Song.create_from_filename(each_file)}
  end

end
