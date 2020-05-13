if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
#---------------------------------------------------------------------------
var = var.encode(ARGV[0].encoding, 'cp1251').encode('UTF-8') if Gem.win_platform? && ARGV[0]
