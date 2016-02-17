#author : Elihu Alejandro Cruz Albores
#version 1.0.2
##Estructura basica de almacenamiento para evitar arrays

class Information
    
    @code #caracter que almacena
    @times #Numero de veces encontraod el elemento
    
    def initialize(code = "", times = 0)
        @code = code
        @times  = times
    end
    
    #define codigo o caracteres
    def setCode(code)
        @code = code
    end
    
    #define repeticiones de cadena
    def setTimes(times)
        @times = times
    end
    
    #retorna la cadena o los caracteres
    def getCode()
        return @code
    end
    
    #retorna el valor de las repeticiones del code.    
    def getTimes()
        return @times
    end
end