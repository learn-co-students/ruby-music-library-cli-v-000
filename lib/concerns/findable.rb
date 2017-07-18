module Concerns
  module Findable
    ####class modules
    def find_by_name(name)
      all.detect{|s| s.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end

  end
end
