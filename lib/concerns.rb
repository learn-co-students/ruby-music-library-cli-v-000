require 'pry'

module Concerns

  module Findable #Class Methods

    def find_by_name(name)
      by_name = all.select{|object| object.name == name}
      by_name[0]
    end

    def find_or_create_by_name(name)
      prospect = find_by_name(name)

      if all.include?(prospect)
        prospect
      else
        create(name)
      end
    end

  end

end
