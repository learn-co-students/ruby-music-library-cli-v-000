require 'pry'

module Concerns
  module Findable
    def find_by_name(name)
      all.find { |value| value.name == name }
    end

    def find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
        create(name)
      end
    end

  end
end

# rspec spec/008_findable_module_spec.rb
