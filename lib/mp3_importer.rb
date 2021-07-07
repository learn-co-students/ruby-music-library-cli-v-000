class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  # Instance Methods
  def files
    file_list = []
    Dir.foreach(path) do |file|
      if file.end_with?("mp3")
        file_list << file
      end
    end
    file_list
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end
end
