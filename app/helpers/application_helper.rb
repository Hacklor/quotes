module ApplicationHelper

  def show_quote(quote_presenter)
    if quote_presenter.has_quote?
      content_tag(:div, quote_presenter.text, :id => 'quote') +
      content_tag(:div, quote_presenter.author, :id => 'author')
    else
      "There are no quotes available"
    end
  end
end
