class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  # def files

  #   Dir.glob(File.join(@path, '*.mp3')).each do |file|
  #     file = file.split("/")[4]
  #     files << file
  #   end
    
  #   @files
  # end

  def files
    file_list = Dir.glob("#{@path}/*.mp3")
    file_list.map do |file|
      file.gsub!("#{@path}/", '')
    end
    file_list
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end