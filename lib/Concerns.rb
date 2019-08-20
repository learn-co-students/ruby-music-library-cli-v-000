module Concerns
  module Findable

    def find_by_name(name)
      self.all.find do |instance|
        instance.name == name
      end
    end

    def find_or_create_by_name(name)
      found_instance = self.find_by_name(name)
      if !found_instance
        new_instance = self.create(name)
        new_instance
      else
        found_instance
      end
    end
    ## End Findable
  end
  ## End Concerns
end
