class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def import
    @list_of_filenames = self.files
    @list_of_filenames.each do |filename|
      Song.create_from_filename(filename)
    end
  end

  def files
    list_of_filenames = Dir.entries(@path).sort
    list_of_filenames.delete_if { |entry| entry.length < 3}
    list_of_filenames.collect do |filename|
      filename.sub!(/^#{@path}\//, '')
    end
    list_of_filenames
  end

end
