#author : Elihu Alejandro Cruz Albores
#version 1.0.2
##Genera un arbol binario con los datos del vector de Objetos
#Infomation, generando las rams del arbol con base en el algoritmo de Huffman

class GenerateCode

    def initialize
    end

    #Genera un arbol con los datos del vector
    #suma elementos para creacion de un nodo padre comun
    #se da por hecho que el vector se encuentra ordenado ? aun por confirmar
        #===>Posible incirporacion de llamada a ordenamiento
    def makeTree(vector)
        index = 0

        new_vector = Array.new()

        for x in vector ##Conversion de datos en bruto a nodos
                        ##Conversion del objeto Information a nodo
                        #para evitar punteros perdidos en generacion de ramas
            new_vector.push(Node.new(x))
        end

        while(new_vector.length != 1) do

            parent_inf = makeNode(new_vector) #Genera el nodo con la fusion

            #Creamos el nodo con los datos del padre, para enlazar las ramas
            node_temp = Node.new(parent_inf,new_vector[0],new_vector[1])

            new_vector.shift()#Eliminamos elemento del inicio

            new_vector[0] = node_temp ##Asignamos a la primera posicion para siguiente fusion

            #mandomos a ordenar
            sortList(new_vector)

            (new_vector.size).times do |i|
                print "[#{new_vector[i].getData().getTimes()} : #{new_vector[i].getData().getCode()}] - "
            end
            puts "\n"
        end
        return new_vector[0]
    end

    def makeNode(new_vector)

        #obtenemos informacion del los elementos para nodo pardre
        parent_times = new_vector[0].getData().getTimes() + new_vector[1].getData().getTimes()
        parent_code = new_vector[0].getData().getCode() + new_vector[1].getData().getCode()

        #Creamos objeto : Infomation con la fusion de los datos
        return Information.new(parent_code, parent_times)
    end

    def sortList(array)
        loop do
            swapped = false
            (array.size - 1).times do |i|
            if array[i].getData().getTimes() > array[i+1].getData().getTimes()
                array[i], array[i+1] = array[i+1], array[i]
                swapped = true
            end
            end
            break unless swapped
        end
        array
    end

    ## Retorna una tabla con los elementos con equivalencia en arbol
    def makeTable_Char(elements,tree)

        inf_table_code = Array.new ##Creamos un nuevo array
        method_search = lambda {|node| node.getData().getCode()} ##Creamos lambda

        (elements.size).times do |i|
            int_times = tree.searchCode(elements[i].getCode(),method_search).join('')
            temp_info = Information.new(elements[i].getCode(),int_times)
            inf_table_code.push(temp_info)
        end

        return inf_table_code
    end

    #generamos albol codificado
    def getCode(tree)
        if(tree == nil)
            return nil
        end

        #Generamos la variable para el codigo del arbol
        codeTree = Array.new

        method_getCode(tree.getRoot(),codeTree)

        puts "#{codeTree}"
        return codeTree
    end

    def method_getCode(node,code)
        if node == nil
            code.pop()
            return
        end

        if isLeaf(node)
            code.push("1")
            code.push(node.getData().getCode().unpack('B8'))
        else
            code.push("0")
            method_getCode(node.getLeft(),code)
            method_getCode(node.getRight(),code)
        end

=begin
        code.push("0")
        if isLeaf(node)
            code.push(node.getData().getCode().unpack('B8')[0])
        end
        method_getCode(node.getLeft(),code)

        code.push("1")
        if isLeaf(node)
            code.push(node.getData().getCode().unpack('B8')[0])
        end
        method_getCode(node.getRight(),code)
=end
    end

    def isLeaf(node)
        return (node.getLeft == nil and node.getRight() == nil);
    end

end
