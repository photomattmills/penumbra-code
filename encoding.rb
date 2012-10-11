# the letters below are actually just placeholders; what glyphs the numbers are actually etched into should be fairly random. Once that's figured out, there'll need to be a second table that translates the letters into the font and vice versa. 
require 'pp'

def encode(plaintext)
  plaintext.split("").map {|pt| "#{glyphs[pt.to_sym]}" rescue nil }.compact.join(" ")  
end

def letter_frequency(text, cyphertext = false)
  length = text.length
  letter_hash = {}
  percent_hash = {}
  if cyphertext
    text.split(" ").each { |char| letter_hash[char] += 1 rescue letter_hash[char] = 1 }
  else
    text.split("").each do |char|
      if char.match /[a-zA-z]/
        letter_hash[char.downcase] += 1 rescue letter_hash[char.downcase] = 1
      end
    end
  end
  letter_hash.each {|key,value| percent_hash[key] = (value.to_f/text.length)*100}
  return percent_hash
end

pt = File.read("lb.txt")
freq = letter_frequency(pt)
pp freq