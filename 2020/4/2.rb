valid_count = 0

input = File.read('input.txt').split(/^$/).map do |record|
  record.gsub(/\s+/, " ").strip.split(" ").map do |value|
    value.split(":")
  end.to_h
end

pp input

input.each do |record|
  valid_count += 1 if record["byr"].to_i.between?(1920, 2002) &&
    record["iyr"].to_i.between?(2010, 2020) &&
    record["eyr"].to_i.between?(2020, 2030) &&
    record["hgt"].to_s.match(/\A(\d+)(cm|in)\z/) &&
      ($1.to_i.between?(150, 193) && $2 == "cm" ||
        $1.to_i.between?(59, 76) && $2 == "in") &&
    record["hcl"].to_s.match(/\A#[0-9a-f]{6}\z/) &&
    record["ecl"].to_s.match(/\Aamb|blu|brn|gry|grn|hzl|oth\z/) &&
    record["pid"].to_s.match(/\A\d{9}\z/)
end

puts "There are #{input.count} passports of which #{valid_count} are valid"
