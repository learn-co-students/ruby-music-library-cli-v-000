require 'bundler'
Bundler.require

module Concerns

      module Findable

        def find_by_name(name)
           all.each do |object|
             if object.name == name
               return object
             else
               nil
             end
           end
        end

        def find_or_create_by_name(name)
                all.each do |object|
                  if object.name == name
                    return object
                  end
                end
                self.create(name)
         end


      end

end

require_all 'lib'
