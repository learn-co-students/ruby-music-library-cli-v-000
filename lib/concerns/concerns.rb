module Concerns

  module Findable

    def find_by_name(name)
      self.all.find {|p| p.name == name} #use .find instead of .select
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name) #I don't like this line
    end

  end

end
