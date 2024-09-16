class MusicLibraryController
   extend Concerns::Findable

      attr_accessor :path

   def initialize(path = " ")
     if path == " "
       @path = "./db/mp3s"
     else
       @path = path
     end
     new_importer = MusicImporter.new(@path)
     new_importer.import
   end

   def call
      command = gets
      until command == "exit"
      command = gets
      end
   end

end
