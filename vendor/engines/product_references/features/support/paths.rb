module NavigationHelpers
  module Refinery
    module ProductReferences
      def path_to(page_name)
        case page_name
        when /the list of product_references/
          admin_product_references_path

         when /the new product_reference form/
          new_admin_product_reference_path
        else
          nil
        end
      end
    end
  end
end
