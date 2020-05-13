current_path = File.dirname(__FILE__)
file_path1 = current_path + '/data/01.txt'
file_path2 = current_path + '/data/02.txt'
file_path3 = current_path + '/data/03.txt'
file_path4 = current_path + '/data/04.txt'

file1 = File.new(file_path1, 'r:UTF-8')
line1 = file1.readlines
puts line1
file1.close
file2 = File.new(file_path2, 'r:UTF-8')
line2 = file2.readlines
puts line2
file2.close
file3 = File.new(file_path3, 'r:UTF-8')
line3 = file3.readlines
puts line3
file3.close
file4 = File.new(file_path4, 'r:UTF-8')
line4 = file4.readlines
puts line4
file4.close
