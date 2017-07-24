module Jekyll
  module Checked
    def title_slide(text)
      @text = text
      "<section data-menu-title=\"#{@text}\">
        #{@text}
      </section>"
    end
    def songify(lyrics, progression)
      content =  lyrics.gsub(/\n/, "<br/>") 
      content =  content.gsub(/(<br\/>){2,}/,"</section><section>") 
      return "<section>" + content + "</section>" 
   
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