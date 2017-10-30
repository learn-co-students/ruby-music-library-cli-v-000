class MusicImporter
  attr_reader :path, :files_array

  def initialize(path)
    @path = path
  end

  def import
    self.files
    @files_array.each { |f| Song.create_from_filename(f) }
  end

  def files
    @files_array = []
    Dir.glob("#{@path}/*.mp3").each do |f|
      file_array = f.split("#{@path}/")
      @files_array << file_array[1]
    end
    @files_array
  end
end
