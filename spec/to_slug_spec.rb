# coding: utf-8

require 'to_slug'

describe String, "to_slug" do

  it "as an option can use space as a delimiter preserving spaces" do
    "This is a string".to_slug(:delimiter=>" ").should == "this is a string"
  end

  it "replaces spaces with dashes" do
    "This is a string".to_slug.should == "this-is-a-string"
  end

  it "converts accented characters to a close ASCII alternative" do
    "aëiòú".to_slug.should == "aeiou"
  end

  it "converts lots of accented characters to a close ASCII alternative" do
    "thîs ís a nåsty strïng éëê. ýůçký".to_slug.should == "this-is-a-nasty-string-eee-yucky"
  end

  it "converts a single accented character to a close ACII alternative" do
    "å".to_slug.should == "a"
  end

  it "converts scores to dashes" do
    "This is an example to_slug".to_slug.should == "this-is-an-example-to-slug"
  end

  it "with the option :preserve_underscore doesn't convert scores to dashes" do
    "This is an example to_slug".to_slug(:preserve_underscore => true).should == "this-is-an-example-to_slug"
  end

  it "with the option :preserve_underscore handles multiple underscores" do
    "This is an example to_______slug".to_slug(:preserve_underscore => true).should == "this-is-an-example-to_slug"
  end

  it "converts periods to dashes" do
    "This.is.an.example.string".to_slug.should == "this-is-an-example-string"
  end

  it "removes leading/trailing whitespace" do
    " this is a string ".to_slug.should == "this-is-a-string"
  end

  it "removes leading punctuation" do
    "!!*% This is leading to somewhere cool".to_slug.should == "this-is-leading-to-somewhere-cool"
  end

  it "removes single quotes" do
    "This is a 'quoted' string".to_slug.should == "this-is-a-quoted-string"
  end

  it "removes double quotes" do
    'This is a "quoted" string'.to_slug.should == "this-is-a-quoted-string"
  end

  it "handles multiple spaces" do
    "I like to put extra spaces.  See".to_slug.should == "i-like-to-put-extra-spaces-see"
  end

  it "preserves dashes" do
    "I like Mrs - on my salad".to_slug.should == "i-like-mrs-on-my-salad"
  end

  it "downcases all characters" do
    "THIS IS SPARTAAAaaa".to_slug.should == "this-is-spartaaaaaa"
  end

  it "accepts empty strings" do
    "".to_slug.should == ""
  end

  it "remains a String class" do
    "I am a string class yo!".to_slug.should be_kind_of(String)
  end
  
  it "removes html entities" do
    "I love my mom & dad; they made me cake".to_slug.should == "i-love-my-mom-dad-they-made-me-cake"
  end
  
  
  # Test all the accents
  
  it "converts accents for the letter A" do
    "À Á Â Ã Ā Ă Ȧ Ả Ä Å Ǎ Ȁ Ȃ Ą Ạ Ḁ Ầ Ấ Ẫ Ẩ Ằ Ắ Ẵ Ẳ Ǡ Ǟ Ǻ Ậ Ặ".to_slug.should == "a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a"
  end

  it "converts accents for the letter AE" do
    "Æ Ǽ Ǣ".to_slug.should == "ae-ae-ae"
  end

  it "converts accents for the letter B" do
    "Ḃ Ɓ Ḅ Ḇ Ƃ Ƅ".to_slug.should == "b-b-b-b-b-b"
  end

  it "converts accents for the letter C" do
    "C Ć Ĉ Ċ Č Ƈ Ç Ḉ".to_slug.should == "c-c-c-c-c-c-c-c"
  end

  it "converts accents for the letter D" do
    "D Ḋ Ɗ Ḍ Ḏ Ḑ Ḓ Ď Đ Ɖ Ƌ".to_slug.should == "d-d-d-d-d-d-d-d-d-d-d"
  end

  it "converts accents for the letter E" do
    "È É Ê Ẽ Ē Ĕ Ė Ë Ẻ Ě Ȅ Ȇ Ẹ Ȩ Ę Ḙ Ḛ Ề Ế Ễ Ể Ḕ Ḗ Ệ Ḝ Ǝ Ɛ".to_slug.should == "e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e"
  end

  it "converts accents for the letter F" do
    "Ḟ Ƒ".to_slug.should == "f-f"
  end

  it "converts accents for the letter G" do
    "Ǵ Ĝ Ḡ Ğ Ġ Ǧ Ɠ Ģ Ǥ".to_slug.should == "g-g-g-g-g-g-g-g-g"
  end

  it "converts accents for the letter H" do
    "Ĥ Ḣ Ḧ Ȟ Ƕ Ḥ Ḩ Ḫ Ħ".to_slug.should == "h-h-h-h-h-h-h-h-h"
  end

  it "converts accents for the letter I" do
    "Ì Í Î Ĩ Ī Ĭ İ Ï Ỉ Ǐ Ị Į Ȉ Ȋ Ḭ Ɨ Ḯ".to_slug.should == "i-i-i-i-i-i-i-i-i-i-i-i-i-i-i-i-i"
  end

  it "converts accents for the letter IJ" do
    "Ĳ".to_slug.should == "ij"
  end

  it "converts accents for the letter J" do
    "Ĵ".to_slug.should == "j"
  end

  it "converts accents for the letter K" do
    "Ḱ Ǩ Ḵ Ƙ Ḳ Ķ".to_slug.should == "k-k-k-k-k-k"
  end

  it "converts accents for the letter L" do
    "Ĺ Ḻ Ḷ Ļ Ḽ Ľ Ŀ Ł Ḹ".to_slug.should == "l-l-l-l-l-l-l-l-l"
  end

  it "converts accents for the letter M" do
    "Ḿ Ṁ Ṃ Ɯ".to_slug.should == "m-m-m-m"
  end

  it "converts accents for the letter N" do
    "Ǹ Ń Ñ Ṅ Ň Ŋ Ɲ Ṇ Ņ Ṋ Ṉ Ƞ".to_slug.should == "n-n-n-n-n-n-n-n-n-n-n-n"
  end

  it "converts accents for the letter O" do
    "Ò Ó Ô Õ Ō Ŏ Ȯ Ö Ỏ Ő Ǒ Ȍ Ȏ Ơ Ǫ Ọ Ɵ Ø Ồ Ố Ỗ Ổ Ȱ Ȫ Ȭ Ṍ Ṏ Ṑ Ṓ Ờ Ớ Ỡ Ở Ợ Ǭ Ộ Ǿ Ɔ".to_slug.should == "o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o"
  end

  it "converts accents for the letter OE" do
    "Œ".to_slug.should == "oe"
  end

  it "converts accents for the letter P" do
    "Ṕ Ṗ Ƥ".to_slug.should == "p-p-p"
  end

  it "converts accents for the letter R" do
    "Ŕ Ṙ Ř Ȑ Ȓ Ṛ Ŗ Ṟ Ṝ Ʀ".to_slug.should == "r-r-r-r-r-r-r-r-r-r"
  end

  it "converts accents for the letter S" do
    "Ś Ŝ Ṡ Š Ṣ Ș Ş Ṥ Ṧ Ṩ".to_slug.should == "s-s-s-s-s-s-s-s-s-s"
  end

  it "converts accents for the letter T" do
    "Ṫ Ť Ƭ Ʈ Ṭ Ț Ţ Ṱ Ṯ Ŧ".to_slug.should == "t-t-t-t-t-t-t-t-t-t"
  end

  it "converts accents for the letter U" do
    "Ù Ú Û Ũ Ū Ŭ Ü Ủ Ů Ű Ǔ Ȕ Ȗ Ư Ụ Ṳ Ų Ṷ Ṵ Ṹ Ṻ Ǜ Ǘ Ǖ Ǚ Ừ Ứ Ữ Ử Ự".to_slug.should == "u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u"
  end

  it "converts accents for the letter V" do
    "Ṽ Ṿ Ʋ".to_slug.should == "v-v-v"
  end

  it "converts accents for the letter W" do
    "Ẁ Ẃ Ŵ Ẇ Ẅ Ẉ".to_slug.should == "w-w-w-w-w-w"
  end

  it "converts accents for the letter X" do
    "Ẋ Ẍ".to_slug.should == "x-x"
  end

  it "converts accents for the letter Y" do
    "Ỳ Ý Ŷ Ỹ Ȳ Ẏ Ÿ Ỷ Ƴ Ỵ".to_slug.should == "y-y-y-y-y-y-y-y-y-y"
  end

  it "converts accents for the letter Z" do
    "Ź Ẑ Ż Ž Ȥ Ẓ Ẕ Ƶ".to_slug.should == "z-z-z-z-z-z-z-z"
  end

  it "converts accents for the letter a" do
    "à á â ã ā ă ȧ ä ả å ǎ ȁ ȃ ą ạ ḁ ẚ ầ ấ ẫ ẩ ằ ắ ẵ ẳ ǡ ǟ ǻ ậ ặ".to_slug.should == "a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a-a"
  end

  it "converts accents for the letter ae" do
    "æ ǽ ǣ".to_slug.should == "ae-ae-ae"
  end

  it "converts accents for the letter b" do
    "ḃ ɓ ḅ ḇ ƀ ƃ ƅ".to_slug.should == "b-b-b-b-b-b-b"
  end

  it "converts accents for the letter c" do
    "ć ĉ ċ č ƈ ç ḉ".to_slug.should == "c-c-c-c-c-c-c"
  end

  it "converts accents for the letter d" do
    "ḋ ɗ ḍ ḏ ḑ ḓ ď đ ƌ ȡ".to_slug.should == "d-d-d-d-d-d-d-d-d-d"
  end

  it "converts accents for the letter e" do
    "è é ê ẽ ē ĕ ė ë ẻ ě ȅ ȇ ẹ ȩ ę ḙ ḛ ề ế ễ ể ḕ ḗ ệ ḝ ɛ".to_slug.should == "e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e-e"
  end

  it "converts accents for the letter f" do
    "ḟ ƒ".to_slug.should == "f-f"
  end

  it "converts accents for the letter g" do
    "ǵ ĝ ḡ ğ ġ ǧ ɠ ģ ǥ".to_slug.should == "g-g-g-g-g-g-g-g-g"
  end

  it "converts accents for the letter h" do
    "ĥ ḣ ḧ ȟ ƕ ḩ ḫ ẖ ħ".to_slug.should == "h-h-h-h-h-h-h-h-h"
  end

  it "converts accents for the letter i" do
    "ì í î ĩ ī ĭ ı ï ỉ ǐ į į ȋ ḭ ɨ ḯ".to_slug.should == "i-i-i-i-i-i-i-i-i-i-i-i-i-i-i-i"
  end

  it "converts accents for the letter ij" do
    "ĳ".to_slug.should == "ij"
  end

  it "converts accents for the letter j" do
    "ĵ ǰ".to_slug.should == "j-j"
  end

  it "converts accents for the letter k" do
    "ḱ ǩ ƙ ḳ ķ".to_slug.should == "k-k-k-k-k"
  end

  it "converts accents for the letter l" do
    "ĺ ḻ ḷ ļ ḽ ľ ŀ ł ƚ ḹ ȴ".to_slug.should == "l-l-l-l-l-l-l-l-l-l-l"
  end

  it "converts accents for the letter m" do
    "ḿ ṁ ṃ ɯ".to_slug.should == "m-m-m-m"
  end

  it "converts accents for the letter n" do
    "ǹ ń ñ ṅ ň ŋ ɲ ṇ ņ ṋ ṉ ŉ ȵ".to_slug.should == "n-n-n-n-n-n-n-n-n-n-n-n-n"
  end

  it "converts accents for the letter o" do
    "ò ó ô õ ō ŏ ȯ ö ỏ ő ǒ ȍ ȏ ơ ǫ ọ ɵ ø ồ ố ỗ ổ ȱ ȫ ȭ ṍ ṏ ṑ ṓ ờ ớ ỡ ở ợ ǭ ộ ǿ ɔ".to_slug.should == "o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o"
  end

  it "converts accents for the letter oe" do
    "œ".to_slug.should == "oe"
  end

  it "converts accents for the letter p" do
    "ṕ ṗ ƥ".to_slug.should == "p-p-p"
  end

  it "converts accents for the letter r" do
    "ŕ ṙ ř ȑ ȓ ṛ ŗ ṟ ṝ".to_slug.should == "r-r-r-r-r-r-r-r-r"
  end

  it "converts accents for the letter s" do
    "ś ŝ ṡ š ṣ ș ş ṥ ṧ ṩ ß ſ ẛ".to_slug.should == "s-s-s-s-s-s-s-s-s-s-s-s-s"
  end

  it "converts accents for the letter t" do
    "ṫ ẗ ť ƭ ʈ ƫ ṭ ț ţ ṱ ṯ ŧ ȶ".to_slug.should == "t-t-t-t-t-t-t-t-t-t-t-t-t"
  end

  it "converts accents for the letter u" do
    "ù ú û ũ ū ŭ ü ủ ů ű ǔ ȕ ȗ ư ụ ṳ ų ṷ ṵ ṹ ṻ ǖ ǜ ǘ ǖ ǚ ừ ứ ữ ử ự".to_slug.should == "u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u-u"
  end

  it "converts accents for the letter v" do
    "ṽ ṿ".to_slug.should == "v-v"
  end

  it "converts accents for the letter w" do
    "ẁ ẃ ŵ ẇ ẅ ẘ ẉ".to_slug.should == "w-w-w-w-w-w-w"
  end

  it "converts accents for the letter x" do
    "ẋ ẍ".to_slug.should == "x-x"
  end

  it "converts accents for the letter y" do
    "ỳ ý ŷ ỹ ȳ ẏ ÿ ỷ ẙ ƴ ỵ".to_slug.should == "y-y-y-y-y-y-y-y-y-y-y"
  end

  it "converts accents for the letter z" do
    "ź ẑ ż ž ȥ ẓ ẕ ƶ".to_slug.should == "z-z-z-z-z-z-z-z"
  end
  
  it "removes unknown accents" do
    "this Ð Þ Ə Ɣ Ɩ Ƣ Ƨ Ʃ Ʊ Ʒ Ǯ Ƹ Ȝ ƿ Ȣ ð þ ə ɣ ɩ ƣ ƨ ʃ is ƪ ʊ ʒ ǯ ƹ ƺ ȝ Ƿ ȣ Ǳ ǲ ǳ a Ǆ ǅ ǆ Ǉ ǈ ǉ Ǌ ǋ ǌ ĸ ƍ ƛ ƾ ƻ Ƽ ƽ string".to_slug.should == "this-is-a-string"
  end

end
