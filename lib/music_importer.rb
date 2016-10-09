class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
    @files = self.files
  end

  def files
    name_array = []
    file_array = Dir["#{@path}/*.mp3"]
    file_name = file_array[0]
    x = 0
    while x < file_array.size do
      file_array[x] = file_array[x+1]
      x+=1
    end
    file_array[x-1] = file_name
    file_array.each do |string|
      string_array = string.split("/")
      name_array << string_array[string_array.size - 1]
    end
    name_array
  end

  def import
    @files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end

end
