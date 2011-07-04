@product_references
Feature: Product References
  In order to have product_references on my website
  As an administrator
  I want to manage product_references

  Background:
    Given I am a logged in refinery user
    And I have no product_references

  @product_references-list @list
  Scenario: Product References List
   Given I have product_references titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of product_references
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @product_references-valid @valid
  Scenario: Create Valid Product Reference
    When I go to the list of product_references
    And I follow "Add New Product Reference"
    And I fill in "Sku" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 product_reference

  @product_references-invalid @invalid
  Scenario: Create Invalid Product Reference (without sku)
    When I go to the list of product_references
    And I follow "Add New Product Reference"
    And I press "Save"
    Then I should see "Sku can't be blank"
    And I should have 0 product_references

  @product_references-edit @edit
  Scenario: Edit Existing Product Reference
    Given I have product_references titled "A sku"
    When I go to the list of product_references
    And I follow "Edit this product_reference" within ".actions"
    Then I fill in "Sku" with "A different sku"
    And I press "Save"
    Then I should see "'A different sku' was successfully updated."
    And I should be on the list of product_references
    And I should not see "A sku"

  @product_references-duplicate @duplicate
  Scenario: Create Duplicate Product Reference
    Given I only have product_references titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of product_references
    And I follow "Add New Product Reference"
    And I fill in "Sku" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 product_references

  @product_references-delete @delete
  Scenario: Delete Product Reference
    Given I only have product_references titled UniqueTitleOne
    When I go to the list of product_references
    And I follow "Remove this product reference forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 product_references
 