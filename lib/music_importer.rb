class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    all_files = []

    Dir.entries(@path).each do |file|
      if file.split(".").include?("mp3")
        all_files << file
      end
    end
    all_files
  end

  def import
    self.files.collect{|file| Song.create_from_filename(file)}
  end
end
