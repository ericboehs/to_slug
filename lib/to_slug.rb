module ToSlug

  # coding: utf-8
  class String # This reopns the string class

    # Define a new method to convert the string to be url friendly
    def to_slug

      # This is the input as there are no arguments passed.
      string = self

      # Define which accents map to which ascii characters
      accents = {
        ['á','à','â','ä','ã'] => 'a',
        ['Ã','Ä','Â','À','�?'] => 'A',
        ['é','è','ê','ë'] => 'e',
        ['Ë','É','È','Ê'] => 'E',
        ['í','ì','î','ï'] => 'i',
        ['�?','Î','Ì','�?'] => 'I',
        ['ó','ò','ô','ö','õ'] => 'o',
        ['Õ','Ö','Ô','Ò','Ó'] => 'O',
        ['ú','ù','û','ü'] => 'u',
        ['Ú','Û','Ù','Ü'] => 'U',
        ['ç'] => 'c', ['Ç'] => 'C',
        ['ñ'] => 'n', ['Ñ'] => 'N'
      }

      # Replace each accent in the string
      accents.each do |accent, replacement|
        accent.each do |character|
          string = string.gsub(character, replacement)
        end
      end

      # Remove any characters that aren't alphanumeric
      string = string.gsub(/[^a-zA-Z0-9 ]/,"")

      # Convert multiple spaces to a single space
      string = string.gsub(/[ ]+/," ")

      # Replace single spaces with a URL friendly dash (-)
      string = string.gsub(/ /,"-")

      # CASE. DOWN. EVERYTHING. (and return since it's the last line)
      string = string.downcase

    end
  end
end
