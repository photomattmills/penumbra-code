# the letters below are actually just placeholders; what glyphs the numbers are actually etched into should be fairly random. Once that's figured out, there'll need to be a second table that translates the letters into the font and vice versa. 

glyphs = {
  :a => 1,:A => 2,:B => 3,:b => 4,:C => 5,:c => 6,:D => 7,:d => 8,:E => 9,:e => 10,:F => 11,:f => 12,:G => 13,:g => 14,:H => 15,:h => 16,:I => 17,:i => 18,:J => 19,:j => 20,:K => 21,:k => 22,:L => 23,:l => 24,:M => 25,:m => 26,:N => 27,:n => 28,:O => 29,:o => 30,:P => 31,:p => 32,:Q => 33,:q => 34,:R => 35,:r => 36,:S => 37,:s => 38,:T => 39,:t => 40,:U => 41,:u => 42,:V => 43,:v => 44,:W => 45,:w => 46,:X => 47,:x => 48,:Y => 49,:y => 50,:Z => 51,:z => 52,:aa => 53,:bb => 54,:cc => 55,:dd => 56,:ee => 57,:ff => 58,:gg => 59,:hh => 60,:ii => 61,:jj => 62,:kk => 63,:ll => 64,:mm => 65,:nn => 66,:oo => 67,:pp => 68,:qq => 69,:rr => 70,:ss => 71,:tt => 72,:uu => 73,:vv => 74,:ww => 75,:xx => 76,:yy => 77,:zz => 78,
}

def encode(plaintext)
  plaintext.split("").map {|pt| "#{glyphs[pt.to_sym]}" rescue nil }.compact.join(" ")  
end

pt = File.read("/Users/engineyard/Desktop/ebooks/lb.txt")

cyphertext = encode(pt)

