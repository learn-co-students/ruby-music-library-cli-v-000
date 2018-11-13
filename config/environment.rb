# the file that loaded all of my libraries
# all of my different files
require 'bundler'
Bundler.require
# read gem file and require in
# the proper gems for our project

module Concerns
end

require_all 'lib'
