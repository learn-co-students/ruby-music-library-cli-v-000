require 'bundler'
Bundler.require

module Concerns
    # Class Methods
    module Findable
      def find_by_name(name)
        self.all.detect {|item| item.name == name}
      end

      def find_or_create_by_name(name)
        result = self.find_by_name(name)
        result != nil ? result : self.create(name)
      end
    end

    module Printable
      def print_alphabetized_by_name
        sorted = self.all.sort_by! {|item| item.name}
        sorted.each do |item|
          puts "#{sorted.index(item)+1}. #{item.name}"
        end
      end
    end #end Printable

  end #end Concerns

require_all 'lib'