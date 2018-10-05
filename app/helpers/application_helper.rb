module ApplicationHelper
  def render_markdown(text)
    Kramdown::Document.new(text, hard_wrap: true ).to_html.html_safe
  end
end
