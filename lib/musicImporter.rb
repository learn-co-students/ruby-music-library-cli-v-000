class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).delete_if do |file|
      !file.include?(".mp3")
    end
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end

# def files
#   Dir.entries(@path).delete_if do |file|
#      !file.include?(".mp3")
#   end
# end
#
# def import
#   self.files.each do |file|
#     Song.new_by_filename(file)
#   end
# end
