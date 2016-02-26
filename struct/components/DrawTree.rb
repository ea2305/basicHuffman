=begin
    Representacion grafica en consola del arbol binario
    Genera nivel por nivel los elementos.
    obtencion de elementos de un nivel
    author : Elihu Alejandro Cruz Albores
    version : 1.0.4
=end

class DrawTree

    SPACE = 60
    #SPACE = 100
    EMPTY = 'X'

    def initialize(root = nil, compare = lambda do |node| node.getData() end)
        @root = root
        @compare = compare
	end

=begin
    Dibuja representacion del arbol actual
    recive los nivels del arbol actual
=end

    def draw(levels)
        puts "Niveles : #{levels}"
        if @root != nil
            getLimit(SPACE)
            method_draw(levels,SPACE,0)
        else
            puts "* LA RAIZ ESTA VACIA !"
        end

    end

    def method_draw(levels,size,current)

        if(levels >= current)
            baseWidth = (size / 2).to_i ##Calculo de la separacion de elementos
            stack = getElementsInLevel(current)#Otenemos los elementos del nivel
            printLinesLevel(baseWidth,stack,current) #Impresion de elementos
            printLevel(baseWidth,stack,current) ##Imprimimos los elementos del nivel
            puts ##Saltamos de linea

            method_draw(levels,baseWidth,current += 1)
        end
    end

    ##Imprimimos lo elementos del stack : contenido del nilvel en el arbol
    #Importante recivir ele estack de elementos, para impresion de nodos
    def printLevel(baseWidth,stack,i)
        #print stack
        for j in 0..(( 2**i ) - 1)
            element = stack[j].to_s.length
            printSpace(baseWidth - element) #imprimimos la separacion del nodo
            print stack[j] #Impresion del contenido del nodo
            printSpace(baseWidth) #Impresion de separacion de nodo a nodo
        end
    end

    #Impresion de lineas para conectar hojas con ramas
    def printLinesLevel(baseWidth,stack,i)
        if i == 0
            return
        end
        dir = 1
        for j in 0..(( 2**i ) - 1)
            element = stack[j].to_s.length
            printSpace(baseWidth - 1) #imprimimos la separacion del nodo
            if dir > 0
                print "/"
            else
                print "\\"

            end
            printSpace(baseWidth) #Impresion de separacion de nodo a nodo
            dir *= -1
        end
        print "\n"
    end

    ##Impresion de la separcion de elementos
    def printSpace(n)
        for i in 0..n
            print " "
        end
    end

    #Muestreo de Arbol
    def getLimit(start_size)
        # 79 espacios para consola normal
        # 140 espacios para consola completa

        for j in 0..start_size
            print "x"
        end
        puts
    end

    #Otiene los elementos dentro de un nivel del arbol binario
    def getElementsInLevel(level)
        if @root != nil #validacion de nodo vacio
            stack = Array.new
            if level == 0
                return stack.push(@root.getData()) ##Agremos los datos al stack
            end
            return moveTree(@root,level,stack,0) #Nos movemos dentro del arbol
        end
    end

    ##Desplazamiento dentro del arbol
    def moveTree(node,level,stack,current)
        if(level == current) ##Cargamos los datos al stack
            stack.push((node != nil)? node.getData() : EMPTY)
        end
        if node != nil
            moveTree(node.getLeft(),level,stack,current += 1)
            current -= 1
            moveTree(node.getRight(),level,stack,current += 1)
            current -= 1
            return stack
        else #En caso de que elemento se sea un nodo inexistente
            if level > current
               target = 2**((level - current)) #Calculamos la diferencia de nivel
               for i in 0..(target - 1)
                   stack.push(EMPTY) ##Agregamos elemento basura
               end
            end
        end
    end
end
