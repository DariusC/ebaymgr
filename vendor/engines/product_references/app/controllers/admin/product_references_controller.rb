module Admin
  class ProductReferencesController < Admin::BaseController

    crudify :product_reference,
            :title_attribute => 'sku', :xhr_paging => true

  end
end
