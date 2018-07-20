class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @file_array = Dir.entries(@path).select{|f| File.file?(@path+"/"+f)}
  end

  def import
    files
    if @file_array
      @file_array.each do |filename|
        Song.create_from_filename(filename)
      end
    end
  end
end
