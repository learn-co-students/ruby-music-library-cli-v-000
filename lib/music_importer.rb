class MusicImporter

  # attr_accessor :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    @files = Dir["#{@path}/*"]
    @files = @files.collect do |file|
        file_array = file.split("/")
        file_name = file_array[file_array.length - 1]
        file_name
    end
  end

  def import
    self.files.each do |file|
      new_song = Song.create_from_filename(file)
    end
  end

end
