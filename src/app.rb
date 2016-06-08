require_relative '../lib/test_examples'
require_relative '../lib/master_splinter'

puts 'Simple program to demonstrate minitest, mocha, and webmock'
TestExamples.new(MasterSplinter.new).go_ninja_go_ninja_go {:variables=>{:turtle=>"power"}}.to_json
