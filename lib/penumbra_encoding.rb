# encoding: utf-8
module PenumbraEncoding #even though I hate camelcase    
  
  
  # this letter frequency table was generated using lb.txt, wich is the text of cory doctorow's "little brother." I hope he approves of its use for the end of creating a nefarious code. Ideally I'd be using the text of Penumbra, but I don't have a digital copy, and Cory's is CC licensed, so I think my using it here is at least legal. 
  
  # to make this look like noise as far as frequency is concerned, you'd need a lot of characters: 1691. Luckily, hope is not lost. Removing the four smallest percentages yields a much more doable number: 102. even better, if you add those to the total of the fifth number, it brings the total glyphs needed to a totally reasonable 70. All letters less than v are henceforth v's. 
  
  # letters sorted by frequency, least to most:
  #[["q", 0.044999045474793],
  # ["z", 0.0822709821306821],
  # ["x", 0.140148542303648],
  # ["j", 0.146815067559173],
  # ["v", 0.679379528313036],
  # ["k", 0.959525100982706],
  # ["b", 1.25648849872881],
  # ["f", 1.41709115261191],
  # ["p", 1.46481741296397],
  # ["y", 1.80708288006012],
  # ["g", 1.81087067850076],
  # ["w", 1.87980861012039],
  # ["m", 1.9479889820519],
  # ["c", 1.96404924744021],
  # ["u", 2.33510198268522],
  # ["l", 2.98720936222565],
  # ["d", 3.4556842733639],
  # ["h", 4.25021287427236],
  # ["r", 4.28339398861236],
  # ["s", 4.64141669722157],
  # ["n", 5.09428587878439],
  # ["i", 5.28322126500347],
  # ["a", 6.0485080619502],
  # ["o", 6.11774901744508],
  # ["t", 7.33302626913975],
  # ["e", 9.26783371261822]]
  
  CHARACTERS = "a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 @ # $ % ^ & * ( ) ! ; : ' ¶ ❡ ℑ ℊ Œ Æ æ ℞ ß Ʊ Ƹ ƿ Ə".split " "
  
  LETTER_FREQUENCY = {
      "a" => 6.0485080619502,
      "b" => 1.25648849872881,
      "c" => 1.96404924744021,
      "d" => 3.4556842733639,
      "e" => 9.26783371261822,
      "f" => 1.41709115261191,
      "g" => 1.81087067850076,
      "h" => 4.25021287427236,
      "i" => 5.28322126500347,
      "j" => 0.146815067559173,
      "k" => 0.959525100982706,
      "l" => 2.98720936222565,
      "m" => 1.9479889820519,
      "n" => 5.09428587878439,
      "o" => 6.11774901744508,
      "p" => 1.46481741296397,
      "q" => 0.044999045474793,
      "r" => 4.28339398861236,
      "s" => 4.64141669722157,
      "t" => 7.33302626913975,
      "u" => 2.33510198268522,
      "v" => 0.679379528313036,
      "w" => 1.87980861012039,
      "y" => 1.80708288006012,
      "z" => 0.0822709821306821,
      "x" => 0.140148542303648
  }
  
  require 'pp'
  
  def create_key 
    #this sets the relationship from the letters to the characters in the font. if you're implementing this, be sure to record it somewhere, like a file, a database, a set of letters for casting type that will be relics of a secret society; you know, somewhere safe. 
    output = {}
    characters_copy = CHARACTERS
    LETTER_FREQUENCY.each do |letter, number|
      if letter == "x" || letter == "z" || letter == "q" || letter == "j" || letter == "v" ||
        unless output["v"]
          output["v"] = [characters_copy[rand(CHARACTERS.length)]]
        end
      else
        output[letter] = [] 
        number.round.times do
          output[letter] << characters_copy[rand(CHARACTERS.length)]
        end
      end
      characters_copy - output[letter] if output[letter]
    end
    return output
  end
  
  def encode(plaintext, key = create_key)
    cyphertext = plaintext.split("").map {|pt| "#{key[pt.downcase][rand(key[pt.downcase].length)]}" rescue nil }.compact.join(" ")
    return [cyphertext, key]   
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
  
  total = 0
  
  LETTER_FREQUENCY.each do |key,percent|
   total+=(percent/0.95).round
  end
  
end
#
#puts total
#
#key = create_key
##puts key.length
#pp key
#puts CHARACTERS.length
##pp LETTER_FREQUENCY.sort {|a,b| a[1] <=> b[1]}
#