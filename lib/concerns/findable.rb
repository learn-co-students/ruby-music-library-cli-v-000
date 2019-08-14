module Concerns::Findable


    def find_by_name(name)
        all.detect do |x|
          x.name == name
      end
    end

    def find_or_create_by_name(name)
      if find_by_name(name) == nil
        create(name)
      else
        find_by_name(name)
      end
    end


end
