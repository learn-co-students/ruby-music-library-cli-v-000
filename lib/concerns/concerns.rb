module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect {|x| x.name == name}
    end

    def find_or_create_by_name(name)
      if song = find_by_name(name)
        song
      else
        self.new(name).save
      end
    end
  end
end

