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
  click_link "Add quote"

  fill_in "Author", with: "Albert Einstein"
  fill_in "Text", with: "Insanity: doing the same thing over and over again and expecting different results."

  click_button "Save"
end

Then "I see the quote" do
  within '.quotes' do
    should have_content("Albert Einstein")
    should have_content("Insanity")
  end
end
