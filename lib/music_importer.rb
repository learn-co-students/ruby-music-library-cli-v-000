

class MusicImporter

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    files = Dir.entries(@path)
    @files = Array.new
    files.each do |file|
      if file.end_with?(".mp3")
        @files << file
      end
    end

    @files
  end




end
