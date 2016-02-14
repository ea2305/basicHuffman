load './struct/Node.rb'
load './struct/Tree.rb'
load './struct/Information.rb'
load './words/Compare.rb'
load './words/GenerateTable.rb'
load './words/SortChars.rb'

gen = GenerateTable.new  #generamos la instancia del objeto
comp = Compare.new
sort = SortChars.new

test = "elihu alejandro cruz albores"

elements = comp.allChars(test)

table = gen.get_Table(test,elements)

ordTable = sort.shortElements(table)
puts("Otros nuevos ele : #{ordTable}")
#puts("Otros nuevos ele : #{table}")

sort.printInformation(ordTable)

=begin
izquierda = Node.new("IZQUIERDA")
derecha = Node.new("DERECHA")
centro = Node.new("CENTRO",izquierda,derecha)
=end

myTree = Tree.new
myTree.addInTree(10)

myTree.addInTree(11)
myTree.addInTree(12)
myTree.addInTree(13)

myTree.addInTree(9)
myTree.addInTree(8)
myTree.addInTree(7)

#myTree.setRoot(centro)

=begin
puts "Recorridos ::>"
puts "preOrder"
myTree.start_preOrder();
puts ":: inOrder"

puts ":: posOrder"
myTree.start_posOrder();
=end
myTree.start_preOrder();
