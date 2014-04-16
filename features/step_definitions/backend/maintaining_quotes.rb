When "I go to the quotes maintenance page" do
  visit backend_quotes_url
end

Then "I see the quotes" do
  within '.quotes' do
    should have_content(@quote.author)
    should have_content(@quote.text[10])
  end
end

When "I add a new quote" do
  click_link 'Add quote'

  fill_in_quote_form
end

Then "I see the quote" do
  within '.quotes' do
    should have_content(@quote_author)
    should have_content(@quote_text[0..10])
  end
end

When "I edit an existing quote" do
  within '.quotes' do
    click_link 'Edit'
  end

  fill_in_quote_form
end

Then "I see the quote has been updated" do
  within '.quotes' do
    should have_content(@quote_author)
    should have_content(@quote_text[0..10])
  end
end

def fill_in_quote_form
  @quote_author = Faker::Name.name
  @quote_text = Faker::Lorem.sentence

  fill_in 'Author', with: @quote_author
  fill_in 'Text', with: @quote_text

  click_button 'Save'
end
