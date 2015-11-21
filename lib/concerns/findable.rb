module Concerns

  module Findable

    def find_by_name(name)
      all.each do |a|
        if a.name == name
          return a
        end
      end
    end

    def find_or_create_by_name(name)
      exist = find_by_name(name)
      if exist == nil
        self.create(name)
      end
    end
  end

end

