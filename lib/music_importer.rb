class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    # Dir.chdir "#{@path}"
    file_list = Dir.glob("#{@path}/*.mp3")

    @files = []
    file_list.each do |file|
      split_file = file.split("/")
      @files << split_file[-1]
    end
    # binding.pry
    @files
  end

  def import
    # binding.pry
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end
