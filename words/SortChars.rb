##Ordenamiento de tabla de frecuencias
#Cabiar por nodos

class SortChars
    
    def shortElements(elements)#ordena tabla de elementos
        size = elements.length
        
        for i in 0..(size - 1)
            for j in 0..(size - 2)
                if (elements[j].getTimes() > elements[(j + 1)].getTimes())
                    temp = elements[j + 1]#asignacion de
                    elements[(j + 1)] = elements[j]
                    elements[j] = temp 
                end 
            end    
        end
        return elements
    end

    #Impresion de objeto Information
    def printInformation(array)
        for i in 0..array.length - 1
            puts (":: #{array[i].getCode()} :: #{array[i].getTimes()}")
        end
    end

end
