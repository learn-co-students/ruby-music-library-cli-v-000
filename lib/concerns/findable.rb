module Concerns
  module Findable
    def find_by_name(name)
      all.detect {|o| o.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end  
  end

  module CommonUtil
    def destroy_all
      self.all.clear
    end
  end
end