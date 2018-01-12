require 'pry'

class MusicImporter

  @@files = []

  def initialize(path)
    @path = path
        @files = []
  end

  def path
    @path
  end

  def files
    @files = Dir.glob(@path + "/*.mp3")
    @files.each_with_index do |file, index|
      @files[index] = file.scan(/mp3s\/(.+)/)[0][0]
    end
    @files
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end


end
