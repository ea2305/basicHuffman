##Estructura basica de almacenamiento para evitar arrays

class Information
    
    @code #caracter que almacena
    @times #Numero de veces encontraod el elemento
    
    def initialize(code = "", times = 0)
        @code = code
        @times  = times
    end
    
    def setCode(code)
        @code = code
    end
    
    def setTimes(times)
        @times = times
    end
    
    def getCode()
        return @code
    end
    
    def getTimes()
        return @times
    end
end