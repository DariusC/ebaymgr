Given /^I have no product_references$/ do
  ProductReference.delete_all
end

Given /^I (only )?have product_references titled "?([^\"]*)"?$/ do |only, titles|
  ProductReference.delete_all if only
  titles.split(', ').each do |title|
    ProductReference.create(:sku => title)
  end
end

Then /^I should have ([0-9]+) product_references?$/ do |count|
  ProductReference.count.should == count.to_i
end
