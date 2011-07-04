class ProductReferencesController < ApplicationController

  before_filter :find_all_product_references
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product_reference in the line below:
    present(@page)
  end

  def show
    @product_reference = ProductReference.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product_reference in the line below:
    present(@page)
  end

protected

  def find_all_product_references
    @product_references = ProductReference.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/product_references").first
  end

end
