class Jekyll::Converters::Markdown::Songify
  def initialize(config)
  rescue LoadError
  end

  def convert(content)
    content =  content.gsub(/\n/, "<br/>")
    content =  content.gsub(/(<br\/>){2,}/,"</section><section>")

    # Populate an array with paragraphs

    # Detect chorus

    # Interleave chorus between all following verses

    # Join paragraphs with <section>

    # Return the HTML verse

    return content
  end
end
