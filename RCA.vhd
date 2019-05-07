library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RCA is
  generic ( X_len, Y_len : integer := 4);
  port(missingOnes : in std_logic_vector(X_len+Y_len-1 downto 0);
    result : out std_logic_vector(X_len+Y_len-1 downto 0));
  end;
  
architecture addPlease of RCA is
  signal temp : std_logic_vector(X_len+Y_len-1 downto 0) := (others=> '0');
  signal Cin : std_logic_vector(X_len+Y_len downto 0) := (others => '0');
  signal tempsum : std_logic_vector(X_len+Y_len-1 downto 0);
  
  component HA
  port (X, Y : in std_logic;
  S, Cout : out std_logic);
  end component;
  
component FA 
  port (X, Y , Cin: in std_logic;
        S, Cout :out std_logic);
end component;
  
  begin
    addding : process(missingOnes)
    begin
      if(X_len = Y_len) then
        temp(X_len) <= '1';
        temp(X_len-1+Y_len) <='1';
      else
        temp(X_len-1) <= '1';
        temp(Y_Len-1) <= '1';
        temp(Y_len+X_len-1) <= '1';
      end if;
    end process;
    RCAGEN1 : HA port map(missingOnes(0), temp(0), tempSum(0), Cin(1));
    RCAGen : for i in 1 to X_len+Y_len-1 generate
      Ripple : FA port map(missingOnes(i), temp(i), Cin(i), tempsum(i), Cin(i+1));
      end generate;
    result <= tempSum;
    end;
      
    