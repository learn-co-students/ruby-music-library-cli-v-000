
#Referenced Labs
# ruby-collaborating-objects-lab-v-000


class MusicImporter

  attr_accessor :path, :files

  def initialize(filepath)
    @path = filepath
    @files = Dir["#{filepath}/*"]
    #puts "filepath = #{filepath} || files = #{@files}"
  end

  def files
    #puts "files = #{@files}"
    @files.collect do |filepath|
      path = filepath.split("/")
      #puts "path = #{path} | size = #{path.size} || final = #{path[path.size-1]}"
      path[path.size-1]
    end
  end

  def import
    #@files.each{ |filename| Song.create_from_filename(filename.split("/")[3]) } #***OFFICIAL USE split Index
    @files.each{ |filename| Song.create_from_filename(filename.split("/")[4]) } #***SPEC TESTING split Index
    # @files.each do |filename|
    #   temp = filename.split("/")
    #   puts "Filename = #{filename} || temp = #{temp}"
    #   Song.create_from_filename(filename.split("/")[3])
    # end
  end

end
