array = %w[q w e r t y u i o p a s d f g h j k l z x c v b n m
           Q W E R T Y U I O P A S D F G H J K L Z X C V B N M 1 2 3 4 5 6
           7 8 9 0 ! @ # $ % ^ & * ( ) = / * - +]
token = []
n = 15
x = 0
while x < n
  token << array.sample
  x += 1
end
puts token.join
