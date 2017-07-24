module Jekyll
  module Checked
    def checked(text)
      @text = text
      return "foo #{@text}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::Checked)