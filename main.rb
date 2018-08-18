class Library
  attr_accessor :name

  def initialize(name)
    @name = name
    @books = 0
    @current_id = 1
    @catalog = {}
  end

  def add_book
    print "Enter title: "
    title = gets.chomp
    print "Enter author: "
    author = gets.chomp
    print "Enter subject: "
    subject = gets.chomp
    new_book = Book.new(title, author, subject, @current_id)
    @catalog[@current_id] = new_book
    @books += 1
    @current_id += 1
  end

  def remove_book(id)
    print "Are you sure you want to remove #{@catalog[id].title}? y/n: "
    answer = gets.chomp
    case answer
    when "y"
      puts "Deleted"
      @catalog.delete(id)
      @books -= 1
      @current_id -= 1
    when "n"
      puts "Cancelled"
    else
      puts "Unrecognized Input"
    end
  end

  def display
    if @catalog.empty?
      puts "There's nothing here!"
    else
      @catalog.each do |id, book|
        puts book.inspect
      end
    end
  end
end

class Book
  attr_accessor :title, :author, :subject
  def initialize(title, author, subject, id)
    @title = title
    @author = author
    @subject = subject
    @id = id
  end

  def inspect
    "Title: #{@title}, Author: #{@author}, Subject: #{@subject}"
  end
end

puts "Welcome to the Library App!"
print "Input library name: "
name = gets.chomp
library = Library.new(name)
loop do
  puts "\n\nLibrary: #{library.name}"
  puts "Enter an option below"
  puts "(a)dd book | (r)emove book |(d)isplay collection | e(x)it"
  input = gets.chomp
  case input
  when "a"
    library.add_book
  when "r"
    library.remove_book(id)
  when "d"
    library.display
  when "x"
    puts "Goodbye!"
    break
  else
    puts "Invalid input!"
  end
end