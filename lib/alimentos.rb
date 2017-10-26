require "alimentos/version"

class Alimentos
    attr_reader :nombre, :proteinas, :glucidos, :lipidos
    
    def initialize(no, pr, gl, li)
        @nombre = no
        @proteinas = pr * 1.0
        @glucidos = gl * 1.0
        @lipidos = li * 1.0
    end
    
    def to_s
        return "#{@nombre}:\n\tproteinas\t-> #{@proteinas}\n\tglucidos\t-> #{@glucidos}\n\tlipidos \t-> #{@lipidos}\n"
    end
    
    def valorEnergetico
        return @proteinas * 4 + @glucidos * 4 + @lipidos * 9
    end
    
end