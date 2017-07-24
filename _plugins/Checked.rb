module Jekyll
  module Checked
    def title_slide(text)
      @text = text
      "<section data-menu-title=\"#{@text}\">
        #{@text}
      </section>"
    end
    def songify(lyrics, progression)
#      if progression.empty?
#        return 'not defined'
#      else
#        return progression
#      end

      chorus = String.new
      lastPrinted = String.new

      sections = lyrics.split(/\n{2,}/)
      sections.map! {|section| section.strip}

      output = Array.new

      for section in sections
        case section[0]
        when ">"
          type = :chorus
          content = section.slice(1..-1)
          chorus = content
        else
          type = :verse
          content = section
        end

        case lastPrinted
        when :chorus
          output << content
          lastPrinted = type
        when :verse
          output << chorus if type == :verse and chorus
          output << content
          lastPrinted = type
        else
          output << content
          lastPrinted = type
        end
      end

      if lastPrinted == :verse
        output << chorus
      end

      output = "<section>\n#{output.join("\n</section>\n<section>\n")}\n</section>"

      return output
   
      # Populate an array with paragraphs 
   
      # Detect chorus 
   
      # Interleave chorus between all following verses 
   
      # Join paragraphs with <section> 
   
      # Return the HTML verse 
   
      return content 
    end
  end
end

Liquid::Template.register_filter(Jekyll::Checked)