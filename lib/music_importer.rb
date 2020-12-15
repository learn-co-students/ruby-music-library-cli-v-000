
  class MusicImporter
    attr_accessor :path

    def initialize(path)#path points to a string
      @path = path
    end

    def files #getter for files attribute
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import
      files.each { |file| Song.create_from_filename(file) }
    end
end

  #def initialize(path)
  #  @path = path
  #end

  #path retrieves the path provided to the MusicImporter object
  #def path(path = './db/mp3s')

  #end

  #def files
      #@files || = Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    #removes the actual path that is attached to filename and collects the filename only
  #end

#  def import
#    files.each {|file| Song.new_from_filename(file)}
#  end
#end
