# For some reason i don't understand why it has
# to be in ./lib/concerns/findable.rb
# when I try ./lib/concerns.rb and load it up it fails
# I can't seem to find the default PATH for the tests
# in the helper.
#
module Concerns
  module Findable
    def find_by_name(name)
      all.find { |thing| thing.name == name }
    end

    def find_or_create_by_name(name)
      if found = find_by_name(name)
        found
      else
        create(name)
      end
    end
  end
end
