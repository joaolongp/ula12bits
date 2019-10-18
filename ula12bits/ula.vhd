library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.p_ula.all;

entity alu is
 port( op1, op2 : in std_logic_vector(11 downto 0);
 opmode : in op_alu;
 z, cout, ov: out std_logic;
 outalu : out std_logic_vector(11 downto 0)
 );
end alu;
architecture alu of alu is
 signal aa, bb, soma, outalu_interno: std_logic_vector(11 downto 0) ;
 signal mode: std_logic ;
begin
outalu <= outalu_interno;
z <= '1' when outalu_interno = x"000" else '0';
 ---
 --- instancia a soma
 ---
 mode <= '0' when opmode=uADD or opmode=uOP1 else '1';
 aa <= x"000" when opmode=uC2OP1 else op2 when opmode=uSUBOP2 else op1;
 bb <= x"000" when opmode=uOP1 else op1 when opmode=uSUBOP2 else op2;
 
 sb: entity work.soma_sub
 generic map(12)
 port map( a=> aa, b=> bb, mode=>mode, S=> soma, cout=> cout, ov=>ov);
 ---
 --- ULA
 ---
 outalu_interno <=
 op1 and op2 when opmode=uAND else
 op1 or op2 when opmode=uOR else
 op1 xnor op2 when opmode=uXNOR else
 to_StdLogicVector( to_bitvector(op1) sll CONV_INTEGER(op2(3 downto 0)) ) when opmode=uSLL else
 to_StdLogicVector( to_bitvector(op1) srl CONV_INTEGER(op2(3 downto 0)) ) when opmode=uSRL else
 soma; --- uADD, uSUB, uOP1, uSUBOP2
end alu;
