library ieee;
use ieee.std_logic_1164.all;

entity PP_case2 is
     generic ( n : positive := 4);
     port( Y : in std_logic_vector(n-1 downto 0);
           X : in std_logic;
           Z : out std_logic_vector(n-1 downto 0));
end;
     
architecture PP_case2_complements of PP_case2 is 
  component AND2 
      port (X, Y : in std_logic;
            Z  : out std_logic);
  end component;
  
  component NAND2 
      port (X, Y : in std_logic;
            Z  : out std_logic);
  end component;
  signal output : std_logic_vector(n-1 downto 0);
begin
  gen: for i in n-1 downto 0 generate
    begin
      Complement_MSB : if (i<(n-1)) generate
        MSB : NAND2 port map (Y(i), X, output(i));
        end generate;
      Complement_Everything : if (i = (n-1)) generate
        Everything : AND2 port map(Y(i), X, output(i));
        end generate;
      end generate;
      Z <= output;
    end;