#author : Elihu Alejandro Cruz Albores
#version 1.0.3
#Nodo basico para almacenamiento de informacion

class Node

    @data #Almacena datos con fomarmato de code y times
    @left #Apunta a nodo siguiente 0
    @right #apunta a 1
    
    def initialize(data = nil, left  = nil, right = nil)
        @data = data
        @left = left
        @right = right
    end
    
    def setLeft(left)
        @left = left
    end
    
    def getLeft()
        return @left
    end

    def setRight(right)
        @right = right
    end
    
    def getRight()
        return @right
    end

    def setData(data)
        @data = data
    end
        
    def getData()
        return @data
    end
end
