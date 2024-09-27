require 'pry'
class MusicImporter

  attr_accessor :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def path
    @file_path
  end

  def files
  #  Dir.entries(@file_path).reject {|f| File.directory? f}
  Dir.glob("#{@file_path}/*.mp3").collect{|f| f.gsub("#{@file_path}/", "")}
  end

  def import
    self.files.each do |file|
    Song.create_from_filename(file)
    end

  end

end
