value = 100.0

case value
when String
  puts value
when Integer
  puts sprintf '%.2f', value
when Float
  puts sprintf '%.2f', value
end

