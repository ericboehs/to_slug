# coding: utf-8

require 'to_slug'

describe String, "to_slug" do

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
    "I like Mrs - on my salad".to_slug.should == "i-like-mrs---on-my-salad"
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

end
