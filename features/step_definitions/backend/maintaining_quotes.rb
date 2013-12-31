When "I go to the quotes maintenance page" do
  visit backend_quotes_url
end

Then "I see the quotes" do
  within '.quotes' do
    expect(page).to have_content(@quote.text[10])
    expect(page).to have_content(@quote.author)
  end
end
