array = [1, 2, 3, 4, 5]
puts array.to_s
rev_array = []
for item in array
  rev_array.unshift(item)
end
puts rev_array.to_s
