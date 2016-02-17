#author : Elihu Alejandro Cruz Albores
#version 1.0.3
##Ordenamiento de tabla de frecuencias
#Cabiar por nodos

class SortChars
    
    def shortElements(array)#ordena tabla de elementos
        loop do
            swapped = false
            (array.size - 1).times do |i|
            if array[i].getTimes() > array[i+1].getTimes()
                array[i], array[i+1] = array[i+1], array[i]
                swapped = true
            end
            end
            break unless swapped
        end
        array   
    end

    #Impresion de objeto Information
    def printInformation(array)
        for i in 0..array.length - 1
            puts (":: #{array[i].getCode()} :: #{array[i].getTimes()}")
        end
    end

end
