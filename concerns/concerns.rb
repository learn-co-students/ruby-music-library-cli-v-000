module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect do |item|
        item.name == name
      end
    end

    def find_or_create_by_name(name)
      song = self.all.detect do |item|
        item.name == name
      end

      if song != nil
        song
      else
        self.create(name)
      end
    end


  end
end
