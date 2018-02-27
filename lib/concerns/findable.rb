module Concerns::Findable

  #module ClassMethods
    def find_by_name(name)
      all.detect {|instance| instance.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) ? find_by_name(name) : create(name)
    end
  #end

  #module InstanceMethods

  #end

end
