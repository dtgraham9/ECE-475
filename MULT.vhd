----Graham Thompson
----1169362

--------------OR2-----------------

library ieee;
use ieee.std_logic_1164.all;

entity OR2 is
  port(X,Y : in std_logic;
      Z : out std_logic);
end;

architecture ORing of OR2 is
begin
  Z <= X or Y;
end;

-------------- HA ---------------

library ieee;
use ieee.std_logic_1164.all;

entity HA is
  port( X, Y : in std_logic;
        S, Cout : out std_logic);
      end;
      
architecture simpleHA of HA is 
component AND2
  port (x, y : in std_logic;
    Z : out std_logic);
  end component;
  
component XOR2
  port (x, y : in std_logic;
      Z : out std_logic);
  end component;

begin 
  Sum : XOR2 port map(x, y, s);
  carry : AND2 port map(x, y, cout);
end;


--------- AND2 --------------

library ieee;
use ieee.std_logic_1164.all;

entity AND2 is
   port (X, Y : in std_logic;
          Z : out std_logic);
end;

architecture ANDstuff of AND2 is 
begin 
  Z<= X and Y;
end;


----------- RCA -----------------

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
      

------------XOR2----------------

library ieee;
use ieee.std_logic_1164.all;

entity xor2 is
  port ( X, y : in std_logic;
    Z : out std_logic);
end;

architecture Xored of xor2 is 
begin
  Z<=X xor Y;
end;

------------- FA --------------------

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


--------- NAND2 ------------------

library ieee;
use ieee.std_logic_1164.all;

entity NAND2 is
   port (X, Y : in std_logic;
          Z : out std_logic);
end;

architecture NANDstuff of NAND2 is 
begin 
  Z<= not(X and Y);
end;


---------------fetching -------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
package sumArray is
	type sum_array is array(natural range <>, natural range <>) of std_logic;
end package SumArray; 

library ieee;
use ieee.std_logic_1164.all;
use work.sumarray.all;
entity fetching is
	generic ( X_Len: integer := 4;
	         Y_Len: integer := 4 );
	
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

---------------MULT -------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

Library IEEE;
use ieee.std_logic_1164.all;
use work.sumArray.all;
entity MULT is 
  generic ( X_len, Y_len : positive := 4);
  port (X : in  std_logic_vector(X_len-1 downto 0);
        Y : in std_logic_vector(Y_len-1 downto 0);
        P: out std_logic_vector(X_len+Y_len -1 downto 0));
end;

architecture do_multiplaction of MULT is 
  type twoD_array is array(0 to X_len-1, Y_len-1 downto 0) of std_logic;
  signal pps: twoD_array ;
  signal pS : sum_array (0 to X_len-1, Y_len-2 downto  0);
  signal c: sum_array (0 to X_len-1, Y_len-2 downto  0);
  signal missOnes : std_logic_vector(X_len+Y_len-1 downto 0);
  signal final : std_logic_vector(X_len+Y_len-1 downto 0);
    component AND2 
      port (X, Y : in std_logic;
            Z  : out std_logic);
  end component;
  
  component NAND2 
      port (X, Y : in std_logic;
            Z  : out std_logic);
end component;

component HA
  port (X, Y : in std_logic;
  S, Cout : out std_logic);
  end component;
  
component FA 
  port (X, Y , Cin: in std_logic;
        S, Cout :out std_logic);
end component;

component fetching is 
	generic ( X_Len: integer := 4 ; 
	Y_Len: integer := 4 );
	
	port(A, B: in sum_array;
	     begining : in std_logic;
		result: out std_logic_vector(X_Len+Y_Len-1 downto 0));
end component;

component RCA 
 generic ( X_len, Y_len : integer := 4);
  port(missingOnes : in std_logic_vector(X_len+Y_len-1 downto 0);
    result : out std_logic_vector(X_len+Y_len-1 downto 0));
  end component;

begin
  pp_gen:  for i in 0 to X_len-1 generate
      PP_case2 : if(i=(X_len-1)) generate
          PP_case2part2 : for j in 0 to Y_len-1 generate
             PP_caseMSB : if j = Y_len-1 generate
              MSBcase2 :  AND2 port map(Y(j), X(i), PPs(i,j));
            end generate;
            PP_caseEverything : if j <(Y_len-1) generate
              everythingComp : NAND2 port map ( Y(j), X(i), PPs(i,J));
            end generate;
          end generate;
        end generate;
      PP_case1 : if(i<(X_len-1)) generate
        PP_case1Part1 : for j in 0 to Y_len-1 generate
          PP_caseMSB : if j = Y_len-1 generate
            MSBCase1 : NAND2 port map (Y(j), X(i), PPs(i,j));
            end generate;
            PP_case1Everything : if (j < (Y_len-1)) generate
              everything1Comp : AND2 port map (Y(j), X(i), PPs(i,j));
              end generate;
            end generate;
          end generate;
        end generate;

summingPPsFirstRow : for j in 0 to Y_len-2 generate
    FirstRow : HA port map(PPs(0,j+1), PPs(1,J),PS(0,J), C(0,J));
end generate;

MiddleSection : for i in 1 to X_len-2 generate
  Yop : for j in 0 to Y_len-2 generate
    endCase : if (j = (Y_len-2) ) generate 
      endPiece : FA  port map(PPs(i+1,J), PPs(i, J+1), C(i-1,J), PS(i,J), C(i,J));
    end generate;
    normalCase : if (J < (Y_len-2)) generate
      standard : FA  port map( PPs(i+1,j), PS(i-1,J+1), C(i-1,J), PS(i,J), C(i,J));
    end generate;
  end generate;
end generate;      

lastRow : for i in 0 to Y_len-2 generate
  Yoperat : if ( i = 0) generate
    lastAb : HA port map(PS(X_len-2, i+1), C(X_len-2, i), PS(X_len-1, i), C(X_len-1, i));
  end generate;
  Ypast : if ( i > 0 and (i < (Y_len-2))) generate
    titan : FA port map (C(X_len-1,i-1), PS(X_len-2, i+1), C(X_len-2, i), PS(X_len-1, i), C(X_len-1,i));
  end generate;
  YFin :  if( i= (Y_len-2)) generate 
    thanos : FA port map(PS(X_len-2, i-1), PPs(X_len-1, Y_len-1), C(X_len-2, i), PS(X_len-1, i), C(X_len-1, i));
  end generate;
end generate;

genResult : fetching generic map(X_len=>X_len, Y_len=>Y_len) port map(PS, C, PPs(0,0), missOnes);
  
FinalGen : RCA generic map(X_len, Y_len) port map(missOnes, final); 

P <= final;
end;

