require "lib/alimentos"

describe Alimentos do
  
  before :all do
    @al1 = Alimentos.new("Huevo Frito", 14.1, 10.0, 19.5)
  end
  
   describe "Debe almacenar los datos" do
    it "Debe tener nombre" do
      expect(@al1.nombre).to_not eq(nil) 
    end
   it "Debe tener proteinas" do
      expect(@al1.proteinas).to_not eq(nil) 
    end
    it "Debe tener glucidos" do
      expect(@al1.glucidos).to_not eq(nil) 
    end
    it "Debe tener lipidos" do
      expect(@al1.lipidos).to_not eq(nil) 
    end
  end
  
  describe "Debe tener metodos para acceder a los datos" do
    it "Debe poder accederse al nombre" do
      expect(@al1.nombre).to eq("Huevo Frito") 
    end
   it "Debe poder accederse a las proteinas" do
      expect(@al1.proteinas).to eq(14.1) 
    end
    it "Debe poder accederse a los glucidos" do
      expect(@al1.glucidos).to eq(10.0) 
    end
    it "Debe poder accederse a los lipidos" do
      expect(@al1.lipidos).to eq(19.5) 
    end
  end
  
  describe "Debe tener algunos métodos más complejos" do
    it "Debe tener salida formateada a texto" do
      string = "Huevo Frito:\n\tproteinas\t-> 14.1\n\tglucidos\t-> 10.0\n\tlipidos \t-> 19.5\n"
      expect(@al1.to_s).to eq(string)
    end
    it "Debe tener un metodo para obtener el valor energetico del alimento"do
      expect(@al1.valorEnergetico).to eq(14.1*4 + 10.0*4 + 19.5*9)
    end
  end
  
  describe "Probamos el modulo Comparable" do
    alMayor = Alimentos.new("Huevo Frito Grande", 13.1, 20.0, 18.5)
    alMenor = Alimentos.new("Huevo Frito Pequeño", 11.1, 6.0, 12.5)
    alIgual = Alimentos.new("Otro Huevo Frito", 14.1, 10.0, 19.5)
    
    it "Debe ser mayor" do
      expect(@al1 > alMayor).to eq(false)
      expect(@al1 > alMenor).to eq(true)
      expect(@al1 > alIgual).to eq(false)
    end
    it "Debe ser menor" do
      expect(@al1 < alMayor).to eq(true)
      expect(@al1 < alMenor).to eq(false)
      expect(@al1 < alIgual).to eq(false)
    end
    
    it "Debe ser igual" do
      expect(@al1 == alMayor).to eq(false)
      expect(@al1 == alMenor).to eq(false)
      expect(@al1 == alIgual).to eq(true)
    end
    
  end

end

describe GrupoAlimento do
  
  before :all do
   @alimento =  GrupoAlimento.new("Huevos, leche y derivados", "Huevo Frito", 14.1, 10.0, 19.5)
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