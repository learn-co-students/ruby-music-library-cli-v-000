
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
    # @the_files = self.files  #might cause an infinite loop problem with @files? prob not with @the_files
  end

  def files
    Dir.entries(self.path).select {|filename| filename.include?(".mp3")}
  end

  # It seems like a mistake that they ask for .import to be a class method ?
  # def self.import
  #   current_import = MusicImporter.new
  #   ...
  # end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end

    ### OR ??? ###
    # @the_files.each do |file|
    #   Song.new_by_filename(file)
    # end

  end

end

##### code from other assignment for reference #####

# mp3_importer.rb

# class MP3Importer
#
#   attr_accessor :path, :files
#
#   def initialize(music_path)
#     @path = music_path
#     @files = self.set_files
#   end
#
#   def set_files
#     Dir.entries(self.path).select {|filename| filename.include?(".mp3")}
#   end
#
#   def import
#     self.files.each do |file|
#       Song.new_by_filename(file)
#     end
#   end
#
# end
