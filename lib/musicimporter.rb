class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    # @path = "./spec/fixtures/mp3s"
    # binding.pry
    dir = Dir.open(@path)
    dir.each do |file_name|
      # file_name = file_name.chomp(".mp3")
      @files << file_name if (file_name.size > 2)
    end
    @files
  end

end
