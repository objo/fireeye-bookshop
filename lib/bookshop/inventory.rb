module Bookshop
  class Inventory

    def initialize(books, magazines, *args)
      @inventory = {}
      add_books(books) if books
      add_magazines(magazines) if magazines
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

    def add_magazines(magazine_array)
      magazine_array.each { |magazine| @inventory[magazine[:identifier]] = Magazine.new(magazine) }
    end
  end

  class Book
    attr_accessor :identifier, :base_price
    STORE_FEE = 4.75
    
    def initialize(params)
      @identifier = params[:identifier]
      @base_price = params[:base_price].to_f
    end

    def price
      (base_price + STORE_FEE) * 1.05
    end
  end

  class Magazine
    attr_accessor :identifier, :base_price
    STORE_FEE = 1.35
    
    def initialize(params)
      @identifier = params[:identifier]
      @base_price = params[:base_price].to_f
    end

    def price
      (base_price + STORE_FEE) * 1.05
    end

  end
  
end
