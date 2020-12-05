valid_count = 0

input = File.read('input.txt').split(/^$/)

input.each do |record|
  valid_count += 1 if record.include?("byr:") &&
    record.include?("iyr:") &&
    record.include?("eyr:") &&
    record.include?("hgt:") &&
    record.include?("hcl:") &&
    record.include?("ecl:") &&
    record.include?("pid:")
end

puts "There are #{input.count} passports of which #{valid_count} are valid"
