Quote = Struct.new :description, :author do
  attr_reader :description, :author
end

Given /^there are quotes present in the system$/ do
  @quote = Quote.new(
    "Don't cry because it's over, smile because it happened.",
    "Dr. Seuss")
end

When /^I view the quotes page$/ do
  visit random_quotes_path
end

Then /^I see a quote$/ do
  expect(page).to have_css('.quote', text: @quote.description)
end

And /^I see the author of the quote$/ do
  expect(page).to have_css('.quote div#author', text: @quote.author)
end
