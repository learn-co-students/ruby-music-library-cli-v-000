# TESTING
===============================================
rspec --format=html > spec.html
httpserver
# running (LOC 2) command in terminal sends spec test to html file which can then be opened in browser for a clearer view of what needs to be done. Run hhtpserver after to view in browser.
===============================================
# How to create console with all environment code loaded into it to play with all current objects
=> Create bin/console
=> add lines below
require_relative '../config/environment'
require 'irb'
IRB.start
=> Run console

# all methods
Song.methods.sort
# created class methods only
Song.singleton_methods.sort

# core only
Song.private_methods.sort
# find out what this does
Song.protected_methods.sort
# All instance methods
Song.instance_methods
# Only shows instance methods defined in class (EXCLUDES INHERITED)
Song.instance_methods(false).sort
