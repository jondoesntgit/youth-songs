class Jekyll::Converters::Markdown::Raw
  def initialize(config)
  rescue LoadError
  end

  def convert(content)
    return content
  end
end
