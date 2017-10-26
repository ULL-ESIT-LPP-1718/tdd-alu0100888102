require "lib/alimentos"

describe Alimentos do
  
  before :all do
    @al1 = Alimentos.new("Huevo Frito", 14.5, 10.0, 19.5)
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
      expect(@al1.proteinas).to eq(14.5) 
    end
    it "Debe poder accederse a los glucidos" do
      expect(@al1.glucidos).to eq(10.0) 
    end
    it "Debe poder accederse a los lipidos" do
      expect(@al1.lipidos).to eq(19.5) 
    end
  
  end
  
  
end
