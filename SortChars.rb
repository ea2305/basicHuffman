##Ordenamiento de tabla de frecuencias
#Cabiar por nodos
load './struct/Information.rb'

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

    def printArray(array)
        for i in 0..array.length - 1
            puts ("#{array[i]}")
        end
    end

end
