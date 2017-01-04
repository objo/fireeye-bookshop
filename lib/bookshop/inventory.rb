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

  module Item 
    attr_accessor :identifier, :base_price, :store_fee
    
    def initialize(params)
      @identifier = params[:identifier]
      @base_price = params[:base_price].to_f
    end

    def price
      puts "Calling from #{self.class} based on store fee of #{@store_fee}"
      (base_price + @store_fee) * 1.05
    end
  end

  class Book
    include Item
    def initialize(*args)
      @store_fee = 4.75
      super(*args)
    end
  end

  class Magazine
    include Item
    def initialize(*args)
      @store_fee = 1.35
      super(*args)
    end
  end
  
end
