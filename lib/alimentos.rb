require "alimentos/version"

class Alimentos
    attr_reader :nombre, :proteinas, :glucidos, :lipidos
    
    def initialize(no, pr, gl, li)
        @nombre = no
        @proteinas = pr * 1.0
        @glucidos = gl * 1.0
        @lipidos = li * 1.0
    end
    
end