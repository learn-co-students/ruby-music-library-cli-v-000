module Concerns

  module Findable

      def find_by_name(name)  # class method
        self.all.find {|obj| obj.name == name}
      end

      def create_by_name(name)  # class method
        self.new(name)
      end

      def find_or_create_by_name(name)  # class method
        find_by_name(name).nil? ? create_by_name(name) : find_by_name(name)
      end

  end

  module Maintainable
  end
end
