module Memorable

  module InstanceMethods

    def initialize(name)
      @name = name
      @songs = []
    end

    def save
      self.class.all << self
    end

    def add_song(song)
        @songs << song unless @songs.include?(song)
    end

  end

  module ClassMethods

    def destroy_all
      self.all.clear
    end

    def create(name)
      new_song = self.new(name)
      new_song.save
      new_song
    end

  end

end
