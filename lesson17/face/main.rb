time = Time.now
file_name = "face_" + time.strftime("%Y.%m.%d_%H-%M-%S") + ".txt"

part_names = %w[foreheads eyes noses mouths]

contents = []

contents = part_names.map do |part_name|
  path = "#{__dir__}/data/#{part_name}.txt"
  File.readlines(path, chomp: true)
end

face = contents.map do |part_array|
  part_array.sample
end

file = File.new("./" + file_name, "a:UTF-8")

file.puts(face)

file.close
