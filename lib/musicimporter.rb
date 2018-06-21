require 'pry'
class MusicImporter
  @@files = []

  attr_accessor :path

  def initialize(file_path)
    @path = file_path

  end

  def files
    Dir["#{@path}/**/*.mp3"].each do |file_name|
      @@files << file_name.gsub!(/.\/spec\/fixtures\/mp3s\//,"")
    end
    #binding.pry

    @@files
  end

  def import
    #binding.pry
    @@files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end

end
