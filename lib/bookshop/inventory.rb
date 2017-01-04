module Bookshop
  class Inventory

    def initialize(books, *args)
      @inventory = {}
      add_books(books)
    end

    def calculate_price(identifier)
      find(identifier).price
    end

    def size
      @inventory.size
    end

    def find(identifier)
      @inventory[identifier]
    end
    
    private
    def add_books(book_array)
      book_array.each { |book| @inventory[book[:identifier]] = Book.new(book) }
    end
  end
  
  class Book

    attr_accessor :identifier, :base_price
    STORE_FEE = 4.75

    def initialize(params)
      @identifier = params[:identifier]
      @base_price = params[:base_price]
    end

    def price
      (base_price + STORE_FEE) * 1.05
    end
  end
  
end
