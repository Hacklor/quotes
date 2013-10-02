Given 'there are no quotes in the system' do
end

Given 'there are quotes present in the system' do
  @quote = Quote.create!(text: Faker::Lorem.sentence,
                author: Faker::Name.name)
end

When 'I view the quotes page' do
  visit random_quotes_path
end

Then 'I see that no quotes are available' do
  expect(page).to have_text('There are no quotes available')
end

Then 'I see a quote' do
  expect(page).to have_css('.quote', text: @quote.text)
end

And 'I see the author of the quote' do
  expect(page).to have_css('.quote div#author', text: @quote.author)
end
