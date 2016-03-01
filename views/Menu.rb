=begin
    author : Elihu Alejandro Cruz Albores
    version : 1.0.2
=end
class Menu

    BORDER = 30

    def initialize(title = "Menu",options = ["none"])
        @title = title
        @options = options
    end

    #get values of options
    #recive Array values
    def printOptions(options)
        count = 0
        options.each do |e|
            print "#{count += 1}.-#{e} :\n"
        end
    end

    def printTitle(title = @title)
        puts "#{("*" * BORDER)} [ #{title} ] #{("*" * BORDER)}"
    end

    def printBottom
        print "*" * ((BORDER * 2) + @title.size)
    end

    def getMenu(title = @title,options = @options)
        printTitle(title)
        printOptions(options)
        printBottom
    end
end
