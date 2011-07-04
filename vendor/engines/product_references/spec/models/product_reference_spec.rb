require 'spec_helper'

describe ProductReference do

  def reset_product_reference(options = {})
    @valid_attributes = {
      :id => 1,
      :sku => "RSpec is great for testing too"
    }

    @product_reference.destroy! if @product_reference
    @product_reference = ProductReference.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_product_reference
  end

  context "validations" do
    
    it "rejects empty sku" do
      ProductReference.new(@valid_attributes.merge(:sku => "")).should_not be_valid
    end

    it "rejects non unique sku" do
      # as one gets created before each spec by reset_product_reference
      ProductReference.new(@valid_attributes).should_not be_valid
    end
    
  end

end