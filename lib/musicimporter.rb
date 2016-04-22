class MusicImporter
   attr_reader :path

  def initialize(path)
    @path = path
    self.files
  end

  def files
    @file = []
    list_of_file = Dir.new(self.path)
    list_of_file.each do |file_name|
      @file << file_name if file_name.include? '.mp3'

    end
    @file.sort

  end

  def import
    self.files.each {|d| Song.new_from_filename(d)}
  end
end