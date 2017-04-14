module Memorable
  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      object = self.new(name).tap do |object|
        object.save
      end
    end

    def split_filename(filename)
      song = filename.split(" - ").tap do |song|
        song[2].chomp!(".mp3")
      end
      #song = filename.split(" - ")
      #song[2].chomp!(".mp3")
      #song
    end
  end

  module InstanceMethods
    def save
      self.class.all << self
    end
  end
end
