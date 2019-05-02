Library IEEE;
use ieee.std_logic_1164.all;

entity MULT is 
  generic ( X_len, Y_len : positive := 4);
  port (X : in  std_logic_vector(X_len-1 downto 0);
        Y : in std_logic_vecotr(Y_len-1 downto 0);
        P: out std_logic_vector(X_len+Y_len -2 downto 0));
end;

architecture do_multiplaction of MULT is 
  
begin
  
