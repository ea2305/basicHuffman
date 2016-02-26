#author : Elihu Alejandro Cruz Albores
#version 1.0.7

load './struct/components/Node.rb'
load './struct/components/AddTree.rb'
load './struct/components/DrawTree.rb'
load './struct/components/OrderTree.rb'
load './struct/components/RemoveTree.rb'
load './struct/components/SearchTree.rb'
load './struct/Tree.rb'
load './struct/Information.rb'
load './words/Compare.rb'
load './words/GenerateTable.rb'
load './words/SortChars.rb'
load './huffman/GenerateCode.rb'

gen = GenerateTable.new  #generamos la instancia del objeto
comp = Compare.new
sort = SortChars.new

#test = "aeiaeia"
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

puts"======>"

code_gen = GenerateCode.new

myLambda = lambda {|node| puts ">> : #{node.getData().getCode()}" } # Creamos el metodo de impresion del arbol

arbol_code = Tree.new(code_gen.makeTree(ordTable),myLambda)##Obtenemos el nodo raiz para el arbol
puts "\n---------------------->"


arbol_code.preOrder(myLambda) ##Imprimimos los datos por in order
#arbol_code.printLevelOrder(myLambda)

puts " ----------------------- "

#generamos la tabla de transformacion
table_transform = code_gen.makeTable_Char(ordTable,arbol_code)
(table_transform.size).times do |i|
    puts "#{table_transform[i].getCode()} :: #{table_transform[i].getTimes()}"
end


puts "--------"

puts code_gen.getCode(arbol_code)
