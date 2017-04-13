module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect{|klass| klass.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    def printer
      self.all.each{|artist| puts artist.name}
    end

    def list
      name = gets.strip
      self.find_by_name(name).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end
  end
end
