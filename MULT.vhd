Library IEEE;
use ieee.std_logic_1164.all;

entity MULT is 
  generic ( X_len, Y_len : positive := 4);
  port (X : in  std_logic_vector(X_len-1 downto 0);
        Y : in std_logic_vector(Y_len-1 downto 0);
        P: out std_logic_vector(X_len+Y_len -1 downto 0));
end;

architecture do_multiplaction of MULT is 
  type twoD_array is array(3 downto 0, 3 downto 0) of std_logic;
  signal intermediate: twoD_array ;
  signal input : std_logic_vector(7 downto 0);
begin
  intermediate(3,1) <= '1';
  signal_builder : for i in 3 downto 0 generate
    input(i) <= intermediate(3, i);
end generate;
  signal_builder2 : for i in 7 downto 4 generate
    input(i) <= intermediate(3, i-4);
end generate;
  
end;

