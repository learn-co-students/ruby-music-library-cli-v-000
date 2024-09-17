require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path= path

  end

  def files
    @files= []
    Dir.foreach(path) do|track|
      if track =~ (/[.mp3]{4}/)
       @files<< track
      end
    end
    @files
  end


  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end