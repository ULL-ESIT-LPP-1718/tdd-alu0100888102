require "spec_helper"

RSpec.describe Alimentos do
  
  before :all do
    @al1 = alimentos.new()
  end
  
  it "has a version number" do
    expect(Alimentos::VERSION).not_to be nil
  end
  
   describe "Debe almacenar los datos" do
    it "Debe tener nombre" do
      expect(@al1.name).to_not eq(nil) 
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
  
  
end
