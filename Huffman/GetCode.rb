#author : Elihu Alejandro Cruz Albores
#version 1.0.2
#Codifica palabras con base en un arbol de Huffman
class GetCode

    def initialize
        @code = Array.new
    end

    def getText(code)
        puts
        compare = lambda {|x| puts ">>[ : #{x.getData().getCode()} ]"}
        @code = code
        #Obtencion de arbol de huffman
        tree_huffman = Tree.new(createTree(50),compare)
        puts "*"*100
        tree_huffman.preOrder(compare)
        puts "*"*100
        #Obtencion de codigo

        new_code = @code[8..@code.size]
        puts "cadena :: #{new_code}"
        #Generamos el mensaje recivido
        msg = convertCode(new_code,tree_huffman.getRoot())

        return msg
    end

    def convertCode(code,node)

        response = Array.new()

        while(code.size != 0) do
            puts "::->>>#{code}"

            current = node.clone
            moves = 0

            while(current.getLeft != nil and current.getRight() != nil) do

                if code[moves] == "0"
                    current = current.getLeft()
                else
                    current = current.getRight()
                end
                moves += 1
            end

            code = code[moves..code.size]
            response.push(current.getData().getCode())
            puts "\n #{response}"
        end
        return response
    end

    #Genera el arbol de huffman
    def createTree(height)

        puts "\n\n#{@code}\n\n"
        current_node = nil

        if @code[0] == "0"

            #damos por hecho el nodo es una rama y generamos los dos hijos
            data = Information.new("father",height)
            current_node = Node.new(data)

            @code = @code[1..@code.size]

            ##Comemos la cadena validada con
            current_node.setLeft( createTree(height - 1 ) )

            current_node.setRight( createTree(height + 1) )

            return current_node

        elsif @code[0] == "1"

            #Obtenemos la inofacion del codigo
            caracter = [@code[1..8].join]

            data = Information.new(caracter.pack('B*'),height)
            current_node = Node.new(data)
            @code = @code[9..@code.size]

            return current_node
        end
    end

end
