
Given /^there are quotes present in the system$/ do
end

When /^I view the quotes page$/ do
  visit random_quotes_path
end

Then /^I see a quote$/ do
  expect(page).to have_css('.quote',
              text: "Don't cry because it's over, smile because it happened.")
end

And /^I see the author of the quote$/ do
  expect(page).to have_css('.quote div#author', text: "Dr. Seuss")
end
