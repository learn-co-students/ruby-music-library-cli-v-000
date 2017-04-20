module Concerns
  module Findable
    def find_by_name(name)
      @@all.find {|name| name}
    end

    def find_or_create_by_name(name)
        if song = self.all.find {|name| name}
      else
        new_object = self.new(name)
        new_object.save
      end
      new_object
    end

  end


end
