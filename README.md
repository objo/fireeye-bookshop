# Bookshop

In this exercise you will write code to calculate prices for items in a bookshop.

Items include books, magazines, and newspapers. Each item has an identifier and
a base price. A caller will be able to request the final price for an item with a
specific identifier.

The final price for an item is calculated by adding the base price and a store
fee and then applying a 5% tax to that total price. In this exercise final prices
can contain more than 2 decimal places and no rounding should be applied. Each
item type has a different store fee associated with it:
* Books: 4.75
* Magazines: 1.35
* Newspapers: 0.85

For example, a book with a base price of 10.00 should cost 14.75 before tax and
have a final price of 15.4875:

    book_identifier = '1234567'
    books = [{ identifier: book_identifier, base_price: 10.00 }]
    # magazines = ...
    # newspapers = ...

    inventory = Bookshop::Inventory.new(books, magazines, newspapers)
    result = inventory.calculate_price(book_identifier)
    # Result should equal 15.4875

See test/test_inventory.rb for an example test that demonstrates the expected
behavior.

You are free to use the sample code/test provided or you may choose to write
everything yourself.

## Getting Started

To run the tests for this sample application install ruby 1.9.x.

Then execute the test class from the root of the project:

    $ ruby ./test/test_inventory.rb
