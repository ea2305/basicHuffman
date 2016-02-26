=begin
    author : Elihu Alejandro Cruz Albores
    version 1.0.3
    Nodo basico para almacenamiento de informacion
=end
class Node

    @data #Almacena datos con fomarmato de code y times
    @level
    @left #Apunta a nodo siguiente 0
    @right #apunta a 1
    
    #Constructor por defeccto
    def initialize(data = nil, left  = nil, right = nil)
        @data = data
        @level = 0
        @left = left
        @right = right
    end
    
    def setLevel(level)
        @level = level
    end
    
    def getLevel()
        return @level
    end

    #Asignamos el nodo izquierdo    
    def setLeft(left)
        @left = left
    end
    
    #Otbtenemos el nodo izquierdo
    def getLeft()
        return @left
    end

    #Asignamos el nodo derecho
    def setRight(right)
        @right = right
    end
    
    #Obtenemos el nodo derecho
    def getRight()
        return @right
    end

    #Asignamos informacion al nodo
    def setData(data)
        @data = data
    end
    
    #Obtenemos informacion del nodo        
    def getData()
        return @data
    end
end
