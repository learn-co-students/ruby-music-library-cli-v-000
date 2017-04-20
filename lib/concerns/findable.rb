module Concerns
  module Findable
    def find_by_name(name)
      @@all.find {|name| name}
    end

    def find_or_create_by_name(name)
        if song = self.all.find { |song| song.name == name }
      else
        song = self.new(name)
        song.save
      end
      song
    end

  end


end
