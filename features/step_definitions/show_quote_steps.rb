Given 'there is a quote present' do
  @quote = Quote.create!(text: Faker::Lorem.sentence,
                author: Faker::Name.name)
end

When 'I view the quotes page' do
  visit root_url
end

When 'I view the specific quote' do
  visit quote_url(@quote)
end

Then 'I see that no quotes are available' do
  expect(page).to have_text('there are currently no quotes available')
end

Then 'I see a quote' do
  expect(page).to have_css('.quote', text: @quote.text)
  expect(page).to have_css('.quote', text: @quote.author)
end
