module Concerns
  module Findable

    def find_by_name(name)
      all.find{|a| a.name == name}
    end

    def find_or_create_by_name(name)
      object = find_by_name(name)
      if object == nil
        #create a song
        self.create(name)
      else
        object
      end
    end

  end
end
