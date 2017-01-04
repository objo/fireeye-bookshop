module Bookshop
  class Inventory

    def initialize(books, magazines, newspapers)
      @inventory = {}
      add_books(books) if books
      add_magazines(magazines) if magazines
      add_newspapers(newspapers) if newspapers
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

    def add_newspapers(newspaper_array)
      newspaper_array.each { |newspaper| @inventory[newspaper[:identifier]] = Newspaper.new(newspaper) }
    end

  end

  module Item 
    attr_accessor :identifier, :base_price, :store_fee
    
    def initialize(params)
      @identifier = params[:identifier]
      @base_price = params[:base_price].to_f
    end

    def price
      (base_price + store_fee) * 1.05
    end

    private
    def store_fee
      Object.const_get(self.class.to_s + '::STORE_FEE')
    end
  end

  class Book
    include Item
    STORE_FEE = 4.75
  end

  class Magazine
    include Item
    STORE_FEE = 1.35
  end

  class Newspaper
    include Item
    STORE_FEE = 0.85
  end

end
