library IEEE;
use IEEE.STD_LOGIC_1164.all;
package sumArray is
	type sum_array is array(natural range <>, natural range <>) of std_logic;
end package SumArray; 

library ieee;
use ieee.std_logic_1164.all;
library work; 
use work.sumarray.all;
entity fetching is
	generic ( X_Len, Y_Len: integer := 4 );
	
	port(A, B: in sum_array( 0 to X_len-1, Y_len-2 downto 0);
	     begining : in std_logic;
		result: out std_logic_vector(X_Len+Y_Len-1 downto 0));
end fetching;
architecture behav of fetching is
	signal temp : std_logic_vector(X_Len+Y_Len-1 downto 0);
begin
	colonprocess : process(A,B, begining)
	begin
	  temp(0) <= begining;
		for i in 0 to X_Len-1 loop	--column 0
			temp(i+1) <= A(i,0);  -- (Y row, X col)
		end loop; 
		for j in 1 to Y_Len-2 loop
			temp(j+(X_Len)) <= A(X_Len-1,j);
		end loop; 
		temp(X_Len+Y_Len-1) <= B(X_Len-1, Y_Len-2);
	end process;
	result <= temp;
end;