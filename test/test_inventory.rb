require 'test/unit'
require_relative '../lib/bookshop'

class TestInventory < Test::Unit::TestCase

  def setup
    @book_identifier = '8817093c-3f8f-47fc-b740-3f865120413a'
    books = [{ identifier: 'cfd3be00-1aa1-462b-b166-f1a981b37394', base_price: 12.45 },
        { identifier: @book_identifier, base_price: 10.00 },
        { identifier: 'e4cff25e-6d94-4ec0-8ecf-e0cf5e52e951', base_price: 29.50 }]

    magazines = [{ identifier: '6e548db0-804a-4e7e-bd68-968d01b45ad0', base_price: 3.45 },
        { identifier: '1bf498a7-28fc-4be2-a0da-8b3f9c545703', base_price: 5.15 }]
    newspapers = [{ identifier: '1b35e17e-9e37-4348-b2df-761ea80cfa8a', base_price: 1.00 },
        { identifier: '2c9de8c3-b0de-4acc-861d-0b5049350bf7', base_price: 1.50 }]

    @inventory = Bookshop::Inventory.new(books, magazines, newspapers)
  end

  def test_book_price2
    expected_book_price = 15.4875

    assert_equal expected_book_price, @inventory.calculate_price(@book_identifier)
  end
end
