class Book 
  attr_reader :id, :isbn, :title, :publisher

  def initialize(data)
    @id = nil 
    @isbn = data[:isbn]
    @title = data[:title]
    @publisher = data[:publisher]
    # binding.pry
  end
end