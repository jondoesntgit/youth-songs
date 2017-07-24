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

      lastPrinted = String.new

      sections = lyrics.split(/\n{2,}/)
      sections.map! {|section| section.strip}

      prechorus = String.new
      chorus = String.new

      output = Array.new

      for section in sections
        case section[0]
        when ">"
          type = :chorus
          content = section.slice(1..-1).gsub(/\n/, "<br/>") 
          chorus = content
        when "+"
          type = :prechorus
          content = section.slice(1..-1).gsub(/\n/, "<br/>")
          prechorus = content
        else
          type = :verse
          content = section.gsub(/\n/, "<br/>") 
        end

        case lastPrinted
        when :chorus
          #
        when :prechorus
          output << chorus if !chorus.empty? and type == :verse
        when :verse
          output << prechorus if !prechorus.empty? and type == :verse
          output << chorus if !chorus.empty? and type == :verse
        else
          #
        end
        output << content
        lastPrinted = type

      end

      if lastPrinted == :verse
        output << prechorus if !prechorus.empty? and type == :verse
        output << chorus if !chorus.empty? and type == :verse
      end

      if lastPrinted == :prechorus
        output << chorus if !chorus.empty? and type == :verse
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