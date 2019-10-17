--
-- out 2018
--
library ieee,work;
use ieee.std_logic_1164.all;
use work.p_ula.all;

entity tb is
end tb;

architecture a1 of tb is 

   signal op1, op2, outalu: std_logic_vector(11 downto 0);
   signal z, cout, ov  : std_logic;
   signal opmode : op_alu;

 begin

    op1 <= x"AAA", x"BBB" after 35ns;
    op2 <= x"CCC", x"ABC" after 35ns;
    opmode <= uOR;

    sb: entity work.alu
             port map( op1=> op1, op2=> op2, outalu=>outalu, z=>z, cout=>cout, ov=>ov, opmode=>opmode);   
   

        
end architecture;


