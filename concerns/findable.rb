module Concerns

  module Findable

    #class
    # .find_by_name
    # .find_or_create_by_name

    ### SONG
    #     def self.find_by_name(name)
    #       self.all.find { |obj| obj.name == name }
    #     end
    #
    #     def self.find_or_create_by_name(name)
    #       find_by_name(name) ? find_by_name(name) : self.new(name)
    #     end



      def self.find_by_name(name)
        self.all.find {|obj| obj.name == name}
      end
          def self.create_by_name(name)
        self.new(name)
      end
          def self.find_or_create_by_name(name)
        find_by_name(name).nil? ? create_by_name(name) : find_by_name(name)
      end

    end

  module Maintainable

  end
end
