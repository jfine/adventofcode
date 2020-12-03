matches = File.readlines('input.txt').select do |line|
  range_start, range_end, letter, password = line.strip.gsub(":", "").split(/[- ]/)
  (range_start.to_i..range_end.to_i).cover?(password.count(letter))
end

puts "There are #{matches.count} valid passwords"
