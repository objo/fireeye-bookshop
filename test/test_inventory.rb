require 'test/unit'
require_relative '../lib/bookshop'

class TestInventory < Test::Unit::TestCase

  def test_adding_books_to_inventory
    books = [{identifier: "1111", base_price: 5.00}]
    inventory = Bookshop::Inventory.new(books, nil, nil)

    assert_equal 1, inventory.size
  end

  def test_find_returns_book_objects
    identifier = "1111"
    base_price = "5.00"
    
    books = [{identifier: identifier, base_price: base_price}]
    inventory = Bookshop::Inventory.new(books, nil, nil)
    book = inventory.find(identifier)
    
    assert_equal book.class, Bookshop::Book
    assert_equal book.base_price, book.base_price
    assert_equal book.identifier, book.identifier
  end

  def test_calculate_correctly_calculates_book_price
    identifier = "1111"
    base_price = 10.00
    
    books = [{identifier: identifier, base_price: base_price}]
    inventory = Bookshop::Inventory.new(books, nil, nil)

    expected_book_price = 15.4875

    assert_equal expected_book_price, inventory.calculate_price(identifier)
  end

  def test_find_returns_magazine_objects
    identifier = "1111"
    base_price = "5.00"
    
    magazines = [{identifier: identifier, base_price: base_price}]
    inventory = Bookshop::Inventory.new(nil, magazines, nil)
    magazine = inventory.find(identifier)

    assert_equal magazine.class, Bookshop::Magazine
    assert_equal magazine.base_price, magazine.base_price
    assert_equal magazine.identifier, magazine.identifier
  end

  def test_calculate_correctrly_calculates_magazine_price
    identifier = "1111"
    base_price = 5.50
    
    magazines = [{identifier: identifier, base_price: base_price}]
    inventory = Bookshop::Inventory.new(nil, magazines, nil)

    expected_magazine_price = 7.1925
    
    assert_equal expected_magazine_price, inventory.calculate_price(identifier)
  end


end
