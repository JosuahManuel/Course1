require 'yaml'

test_array = ['this is a test array', 'testing yaml', 'try test', 'yaml test']

test_string = test_array.to_yaml

filename = 'testingyaml.txt'

File.open 'testingyaml.txt' , 'w' do |f|

	f.write test_string
end

read_string = File.read 'testingyaml.txt'

read_array = YAML::load read_string

puts (read_string == test_string)

puts (read_array == test_array)