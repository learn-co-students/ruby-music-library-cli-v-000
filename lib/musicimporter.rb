class MusicImporter

  attr_accessor :path

  @@all = []

  def initialize(test_music_path)
    @path = test_music_path
  end

  def files
     output = []
     files = Dir.glob(File.join(@path, "*"))
     temp = files.each do |indiv_file|
       output << indiv_file.split("/")[-1]
     end
     output
  end

  def import
    files.each do |filename|
      Song.new_from_filename(filename)
    end
  end

end
