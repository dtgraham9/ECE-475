----Graham Thompson
----1169362

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Mult_tb is
end entity;

architecture TESTBENCH of Mult_tb is

    component MULT
        generic ( X_Len : integer :=4 ; Y_Len: integer := 4 );
        port (  X : in std_logic_vector(X_Len-1 downto 0);
                Y : in std_logic_vector(Y_Len-1 Downto 0);
                P : out std_logic_vector( X_Len + Y_Len-1 downto 0));
    end component;

    signal X_1: Std_logic_vector(3 downto 0); 
    signal Y_1: Std_logic_vector(3 downto 0);
    signal X_2: std_logic_vector(3 downto 0);
    signal Y_2: std_logic_vector(4 downto 0); 
    signal result1 : Std_logic_vector(7 downto 0);
    signal result2 : Std_logic_vector(8 downto 0);
begin

   UUT1: MULT
   generic map ( 4 , 4 )
   port map ( X_1, Y_1,result1);

    UUT2: MULT
      generic map ( X_len=> 4 ,Y_len=> 5 )
      port map ( X_2,Y_2,result2);


    DATA: process
        variable I, J: integer;
        variable w : unsigned(3 downto 0):= (others => '0');
        variable v : unsigned(3 downto 0):= (others => '0');
        variable v2 : unsigned(4 downto 0):= (others => '0');

    begin
        for I in 0 to 15 loop
           for J in 0 to 15 loop
              X_1<= Std_logic_vector(w);
               Y_1 <= Std_logic_vector(v);
              v := v + "1";
                wait for 25 ns;
            end loop;
            v:=(others => '0');
           w := w + "1";
        end loop;
    end process;

DATA2: process
        variable I, J: integer;
        variable w : unsigned(3 downto 0):= (others => '0');
        variable v : unsigned(4 downto 0):= (others => '0');
    begin

        for I in 0 to 15 loop
           for J in 0 to 31 loop
                X_2 <= Std_logic_vector(w);
                Y_2 <= Std_logic_vector(v);
                v := v + "1";
                wait for 25 ns;
           end loop;
          v:=(others => '0');
           w := w + "1";
       end loop;
    end process;

end TESTBENCH;