class Jekyll::Converters::Markdown::Songify
  def initialize(config)
  rescue LoadError
  end

  def convert(content)
    content =  content.gsub(/\n/, "<br/>")
    content =  content.gsub(/(<br\/>){2,}/,"</section><section>")
    return "<section>" + content + "</section>"
  end
end
