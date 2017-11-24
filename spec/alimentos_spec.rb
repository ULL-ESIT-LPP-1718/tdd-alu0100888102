require "lib/alimentos"

describe Alimentos do

  before :all do
    conc11 = [6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9]
    conc12 = [6.1, 6.6, 6.3, 6.3, 6.1, 6.9, 6.8, 6.5, 6.4, 6.9, 6.8, 6.5, 6.3, 6.2, 6.7, 6.2, 5.9, 5.8, 5.8, 5.8, 5.8, 5.8, 5.9, 6.2, 6.4]
    conc13 = [6.5, 6.5, 6.7, 6.5, 6.5, 6.8, 6.7, 6.2, 6.5, 7.2, 6.9, 7.0, 6.3, 6.2, 6.1, 5.9, 5.8, 6.1, 6.7, 6.7, 6.6, 6.7, 6.9, 7.2, 7.1]
    conc14 = [4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1] 
    
    conc21 = [4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9]
    conc22 = [4.9, 4.9, 5.2, 5.8, 6.5, 7.0, 7.2, 7.3, 7.3, 6.6, 6.2, 6.1, 6.0, 6.1, 5.9, 5.9, 5.9, 5.9, 5.8, 5.8, 5.5, 5.5, 5.6, 5.9, 5.9]
    conc23 = [4.6, 4.6, 4.7, 4.7, 4.8, 4.7, 4.8, 4.8, 4.6, 4.4, 4.7, 4.7, 4.8, 4.7, 5.2, 5.9, 5.9, 5.7, 5.4, 5.3, 5.1, 4.8, 4.8, 4.9, 5.9] 
    conc24 = [6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5] 
    
    
    @compota1 = Alimentos.new("Compota", 14.1, 10.0, 19.5, conc11)
    @compota2 = Alimentos.new("Compota", 14.1, 10.0, 19.5, conc21)
    
    @yogurt1 = Alimentos.new("Yogurt", 14.1, 10.0, 19.5, conc12)
    @yogurt2 = Alimentos.new("Yogurt", 14.1, 10.0, 19.5, conc22)
    
    @chocolate1 = Alimentos.new("Chocolate", 14.1, 10.0, 19.5, conc13)
    @chocolate2 = Alimentos.new("Chocolate", 14.1, 10.0, 19.5, conc23)
    
    @glucosa1 = Alimentos.new("Glucosa", 14.1, 10.0, 19.5, conc14)
    @glucosa2 = Alimentos.new("Glucosa", 14.1, 10.0, 19.5, conc24)
    
    glucosa = [@glucosa1, @glucosa2]
    compota = [@compota1, @compota2]
    yogurt = [@yogurt1, @yogurt2]
    chocolate = [@chocolate1, @chocolate2]
      
    @alimentos = [glucosa, compota, yogurt, chocolate]
    @indices = []
    
  end
  
   describe "Debe almacenar los datos" do
    it "Debe tener nombre" do
      expect(@compota1.nombre).to_not eq(nil) 
    end
   it "Debe tener proteinas" do
      expect(@compota1.proteinas).to_not eq(nil) 
    end
    it "Debe tener glucidos" do
      expect(@compota1.glucidos).to_not eq(nil) 
    end
    it "Debe tener lipidos" do
      expect(@compota1.lipidos).to_not eq(nil) 
    end
  end
  
  describe "Debe tener metodos para acceder a los datos" do
    it "Debe poder accederse al nombre" do
      expect(@compota1.nombre).to eq("Compota") 
    end
   it "Debe poder accederse a las proteinas" do
      expect(@compota1.proteinas).to eq(14.1) 
    end
    it "Debe poder accederse a los glucidos" do
      expect(@compota1.glucidos).to eq(10.0) 
    end
    it "Debe poder accederse a los lipidos" do
      expect(@compota1.lipidos).to eq(19.5) 
    end
  end
  
  describe "Debe tener algunos métodos más complejos" do
    it "Debe tener salida formateada a texto" do
      string = "Compota:\n\tproteinas\t-> 14.1\n\tglucidos\t-> 10.0\n\tlipidos \t-> 19.5\n"
      expect(@compota1.to_s).to eq(string)
    end
    it "Debe tener un metodo para obtener el valor energetico del alimento"do
      expect(@compota1.valorEnergetico).to eq(14.1*4 + 10.0*4 + 19.5*9)
    end
  end
  
  describe "Probamos el modulo Comparable" do
    conc = [6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9]
    
    alMayor = Alimentos.new("Huevo Frito Grande", 13.1, 20.0, 18.5, conc)
    alMenor = Alimentos.new("Huevo Frito Pequeño", 11.1, 6.0, 12.5, conc)
    alIgual = Alimentos.new("Otro Huevo Frito", 14.1, 10.0, 19.5, conc)
    
    it "Debe ser mayor" do
      expect(@compota1 > alMayor).to eq(false)
      expect(@compota1 > alMenor).to eq(true)
      expect(@compota1 > alIgual).to eq(false)
    end
    it "Debe ser menor" do
      expect(@compota1 < alMayor).to eq(true)
      expect(@compota1 < alMenor).to eq(false)
      expect(@compota1 < alIgual).to eq(false)
    end
    
    it "Debe ser igual" do
      expect(@compota1 == alMayor).to eq(false)
      expect(@compota1 == alMenor).to eq(false)
      expect(@compota1 == alIgual).to eq(true)
    end
    
  end
  
  describe "Comprobamos la función del indice glucémico" do
    it "debe tener una lista de concentraciones" do
      expect(@compota1.concentraciones).to_not eq(nil)
    end
    
    it "debe calcularese el AIBC" do
      @alimentos.map! { |x|
        x.map{ |e|
          e.aibc(5)
        }
      }

      expect(@alimentos[0][0]).to eq(255.99999999999997)
      expect(@alimentos[1][0]).to eq(27.49999999999999)
      expect(@alimentos[2][0]).to eq(21.750000000000046)
      expect(@alimentos[3][0]).to eq(7.500000000000005)
      
      expect(@alimentos[0][1]).to eq(186.50000000000003)
      expect(@alimentos[1][1]).to eq(183.25)
      expect(@alimentos[2][1]).to eq(138.49999999999997)
      expect(@alimentos[3][1]).to eq(44.25000000000004)
    end
    
    it "debe calcularse el indice glucémico de los individuos" do
      
      referencia = @alimentos[0]
      @alimentos.map! do |alimento|
        alimento.map.with_index do |x, i|
          (x / referencia[i]) * 100
        end
      end
        
      expect(@alimentos[0][0]).to eq(100)
      expect(@alimentos[1][0]).to eq(10.742187499999996)
      expect(@alimentos[2][0]).to eq(8.49609375000002)
      expect(@alimentos[3][0]).to eq(2.929687500000002)
      
      expect(@alimentos[0][1]).to eq(100)
      expect(@alimentos[1][1]).to eq(98.25737265415549)
      expect(@alimentos[2][1]).to eq(74.26273458445037)
      expect(@alimentos[3][1]).to eq(23.726541554959805)
      
    end
  
    it "Calculamos el indice glucémico de los elementos" do
      @alimentos.map! do |alimento|
        n = alimento.length()
        t = alimento.reduce do |sum, x|
          sum + x
        end
        t / n
      end
      
      expect(@alimentos[0]).to eq(100)
      expect(@alimentos[1]).to eq(54.499780077077745)
      expect(@alimentos[2]).to eq(41.37941416722519)
      expect(@alimentos[3]).to eq(13.328114527479904)
    end
  end

end

describe GrupoAlimento do
  
  before :all do
    conc = [6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9]
   @alimento =  GrupoAlimento.new("Huevos, leche y derivados", "Huevo Frito", 14.1, 10.0, 19.5, conc)
  end
  
  
  describe "Debe tener una clasificación" do
    it "Debe tener grupo" do
      expect(@alimento.grupo).to_not eq(nil)
    end
  end
  
  
  describe "Comprobamos la jerarqia" do
    it "Es hija de Alimentos" do
      expect(@alimento.is_a?Alimentos).to eq(true)
    end
    it "Es hija de Objet" do
      expect(@alimento.is_a?Object).to eq(true)
    end
    it"Es una instancia de Piramide" do
      expect(@alimento.is_a?GrupoAlimento).to eq(true)
    end
  end  
    
  describe "Comprobamos los métodos" do
    it "Debe responder a los metodos de lista" do
        expect(@alimento.respond_to?:valorEnergetico).to eq(true)
    end
    it "Debe tener salida formateada a texto" do
      string = "Huevos, leche y derivados:\tHuevo Frito:\n\tproteinas\t-> 14.1\n\tglucidos\t-> 10.0\n\tlipidos \t-> 19.5\n"
      expect(@alimento.to_s).to eq(string)
    end
    
  end


end