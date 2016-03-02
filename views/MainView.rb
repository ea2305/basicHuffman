=begin
 author : Elihu A. Cruz Albores
 version : 1.0.2
=end

class MainView

    def initialize(title = "Window",controller)
        @title = title
        @controller = controller
    end

    #Inicia la interfaz en consola
    def start()

        #Instancias :::

        options = ["Cargar Datos de Archivo para Codificación","Cargar datos por teclado",
                   "Obtener Tabla de Frecuencias","Generar Arbol de Huffman",
                   "Mostrar Tabla de Transformacion","Generar archivo codificado","Cargar Datos para Decodificación",
                   "Obtener mensage","Salir =>"]

        menu = Menu.new(@title,options)

        select = 1
        while select != 0
            menu.getMenu() #iniciamos el menu

            puts "Introduzca una opcion"
            select = gets.chomp
            select = selector(select)
        end
    end

    #Llamada a controlador
    def selector(option)
        if option.to_i == 0
            return 0
        else
            @controller.callModel(option)
        end
    end

end
