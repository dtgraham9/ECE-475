library ieee;
use ieee.std_logic_1164.all;

entity FA is
port (X, Y , Cin: in std_logic;
        S, Cout :out std_logic);
end;

architecture FullingAdding of FA is 
signal tempSum, tempCout, tempCin : std_logic;

component HA
  port (X, Y : in std_logic;
  S, Cout : out std_logic);
  end component;
  
  Component AND2
    port (X,y : in std_logic;
      Z: out std_logic);
    end component;
    
  component XOR2 
    port (X, y : in std_logic;
      Z:out std_logic);
    end component;
    
  component OR2
    port ( X, y : in std_logic;
      Z: out std_logic);
    end component;
  
begin
  
  tempsumm : HA port map (X, Y, tempSum, Tempcout);
  
  FinalSum: XOR2 port map(tempSum, Cin, S);
  
  CinANDsum : AND2 port map( tempSum, Cin, tempCin);
  
  CoutOR : OR2 port map(tempCout, tempCin, Cout);
  
end;

