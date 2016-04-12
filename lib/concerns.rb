module Concerns

  module Findable

    def find_by_name(name)
      all.detect {|item| item.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) ? find_by_name(name) : create(name)
    end

  end

  module Memorable

    # def new_from_filename

  end
end
