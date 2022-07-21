defmodule Buggy do
  def parse_header(<<format::integer-16, tracks::integer-16, division::bits-16>>) do
    IO.puts("format #{format}")
    IO.puts("tracks #{tracks}")
    IO.puts("division #{decode(division)}")
  end

  def decode(<<0::1, beats::15>>) do
    "🎵 = #{beats}"
  end

  def decode(<<1::1, fps::7, beats::8>>) do
    "#{-fps} fps, #{beats}/frame"
  end
end

# header = <<0,1,0,8,0,120>>
# f = fn(<<k::4, l::4>>) -> "#{k} #{l}" end
# f.(<<2::2, 2::2, 0::4>>)
# f.(<<100>>)

# setting a breakpoint:
# break! Buggy.decode/1
#
# check breakpoints:
# breaks
