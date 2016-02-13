require_relative 'struct/Node.rb'
load './struct/Information.rb'
load 'Compare.rb'
load 'GenerateTable.rb'
load 'SortChars.rb'

gen = GenerateTable.new()#generamos la instancia del objeto
comp = Compare.new()
sort = SortChars.new()

test = "elihu alejandro cruz albores"

elements = comp.allChars(test)

table = gen.get_Table(test,elements)

ordTable = sort.shortElements(table)

puts("Otros nuevos ele : #{elements}")
puts("Nuevos elementos : #{table}")

sort.printArray(ordTable)

