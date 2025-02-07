@singlebrowser
Feature: Browse the catalog

  Background:
    Given Colin has logged onto the application

  Rule: Catalog should show our top 6 products
    Example: Colin reviews our range of products
      When Colin is browsing the product catalog
      Then he should be presented with 6 products


    @Manual
    Example: Colin reviews our range of products by hand
      When Colin is browsing the product catalog
      Then he should be presented with 5 products

    @Manual:Pass
    Example: Colin reviews more of our range of products by hand
      When Colin is browsing the product catalog
      Then he should be presented with 5 products

    @Manual:Fail
    Example: Colin reviews more of our range of products by hand and finds a problem
      When Colin is browsing the product catalog
      Then he should be presented with 5 products

  Rule: Should show the price, description and image of each product
    # This approach assumes we have control over the products being displayed
    Example: Colin views information about each product
      When Colin is browsing the product catalog
      Then he should be presented with the following products:
        | Title                             | Price  |
        | Sauce Labs Backpack               | $29.99 |
        | Sauce Labs Bike Light             | $9.99  |
        | Sauce Labs Bolt T-Shirt           | $15.99 |
        | Sauce Labs Fleece Jacket          | $49.99 |
        | Sauce Labs Onesie                 | $7.99  |
        | Test.allTheThings() T-Shirt (Red) | $15.99 |

  Rule: Customer should be able to view product details for a particular product
    Scenario Outline: Colin views the details for specific products
      Given Colin is browsing the product catalog
      When Colin opens the product details for "<Product Name>"
      Then he should see a product with the following details:
        | Name           | Price   | Description   |
        | <Product Name> | <Price> | <Description> |
      Examples:
        | Product Name             | Price  | Description                                                                  |
        | Sauce Labs Backpack      | $29.99 | carry.allTheThings()                                                         |
        | Sauce Labs Bike Light    | $9.99  | A red light isn't the desired state in testing but it sure helps when riding |
        | Sauce Labs Bolt T-Shirt  | $15.99 | Get your testing superhero                                                   |
        | Sauce Labs Fleece Jacket | $49.99 | a midweight quarter-zip fleece jacket                                        |

  Rule: Customers should be able to sort product details to see the products they are most interested in

    Scenario Outline: Sort products
      Given Colin is browsing the product catalog
      When he filters the products by <Sort Order>
      Then the first product displayed should be <First Product>
      Examples:
        | Sort Order          | First Product                     |
        | Price (low to high) | Sauce Labs Onesie                 |
        | Price (high to low) | Sauce Labs Fleece Jacket          |
        | Name (A to Z)       | Sauce Labs Backpack               |
        | Name (Z to A)       | Test.allTheThings() T-Shirt (Red) |





