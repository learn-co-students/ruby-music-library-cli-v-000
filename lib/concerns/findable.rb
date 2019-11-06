module Concerns
  module Findable
    def find_by_name(instance_name)
      self.all.detect {|instance| instance.name == instance_name}
    end

    def find_or_create_by_name(instance_name)
      self.find_by_name(instance_name) || self.create(instance_name)
    end 
  end
end
