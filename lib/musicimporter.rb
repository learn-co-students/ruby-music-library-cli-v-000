class MusicImporter
  attr_reader :path

     def initialize(path)
       @path = path
     end

     def files
       Dir["#{@path}/*.mp3"].collect {|file_name| file_name.gsub("#{@path}/", "")}
     end

      def import
        files = self.files
        files.each{|f| Song.create_from_filename(f)}
      end
end
