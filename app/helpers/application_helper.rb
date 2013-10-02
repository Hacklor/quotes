module ApplicationHelper

  def show_quote(quote)
    if quote.nil?
      "There are no quotes available"
    else
      content_tag(:div, quote.text, :id => 'quote') +
      content_tag(:div, quote.author, :id => 'author')
    end
  end
end
