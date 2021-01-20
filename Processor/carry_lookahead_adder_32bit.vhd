----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 02.01.2021 22:34:37
-- Module Name: carry_lookahead_adder_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carry_lookahead_adder_32bit is
 Port(
      A, B : in std_logic_vector(31 downto 0);
      carry_in : in std_logic;
      final_sum : out std_logic_vector(31 downto 0);
      carry_out, overflow : out std_logic
      );
end carry_lookahead_adder_32bit;

architecture Behavioral of carry_lookahead_adder_32bit is    
    --signals
    signal carry : std_logic_vector(31 downto 0);
    signal total_sum : std_logic_vector(31 downto 0);
    signal P, G : std_logic_vector(31 downto 0);
begin
    --carry propagate 
    P(0)  <= A(0)  XOR B(0)  after 5ns;
    P(1)  <= A(1)  XOR B(1)  after 5ns;
    P(2)  <= A(2)  XOR B(2)  after 5ns;
    P(3)  <= A(3)  XOR B(3)  after 5ns;
    P(4)  <= A(4)  XOR B(4)  after 5ns;
    P(5)  <= A(5)  XOR B(5)  after 5ns;
    P(6)  <= A(6)  XOR B(6)  after 5ns;
    P(7)  <= A(7)  XOR B(7)  after 5ns;
    P(8)  <= A(8)  XOR B(8)  after 5ns;
    P(9)  <= A(9)  XOR B(9)  after 5ns;
    P(10) <= A(10) XOR B(0)  after 5ns;
    P(11) <= A(11) XOR B(11) after 5ns;
    P(12) <= A(12) XOR B(12) after 5ns;
    P(13) <= A(13) XOR B(13) after 5ns;
    P(14) <= A(14) XOR B(14) after 5ns;
    P(15) <= A(15) XOR B(15) after 5ns;
    P(16) <= A(16) XOR B(16) after 5ns;
    P(17) <= A(17) XOR B(17) after 5ns;
    P(18) <= A(18) XOR B(18) after 5ns;
    P(19) <= A(19) XOR B(19) after 5ns;
    P(20) <= A(20) XOR B(20) after 5ns;
    P(21) <= A(21) XOR B(21) after 5ns;
    P(22) <= A(22) XOR B(22) after 5ns;
    P(23) <= A(23) XOR B(23) after 5ns;
    P(24) <= A(24) XOR B(24) after 5ns;
    P(25) <= A(25) XOR B(25) after 5ns;
    P(26) <= A(26) XOR B(26) after 5ns;
    P(27) <= A(27) XOR B(27) after 5ns;
    P(28) <= A(28) XOR B(28) after 5ns;
    P(29) <= A(29) XOR B(29) after 5ns;
    P(30) <= A(30) XOR B(30) after 5ns;
    P(31) <= A(31) XOR B(31) after 5ns;
    
    --carry generate
    G(0)  <= A(0)  AND B(0)  after 5ns;
    G(1)  <= A(1)  AND B(1)  after 5ns;
    G(2)  <= A(2)  AND B(2)  after 5ns;
    G(3)  <= A(3)  AND B(3)  after 5ns;
    G(4)  <= A(4)  AND B(4)  after 5ns;
    G(5)  <= A(5)  AND B(5)  after 5ns;
    G(6)  <= A(6)  AND B(6)  after 5ns;
    G(7)  <= A(7)  AND B(7)  after 5ns;
    G(8)  <= A(8)  AND B(8)  after 5ns;
    G(9)  <= A(9)  AND B(9)  after 5ns;
    G(10) <= A(10) AND B(10) after 5ns;
    G(11) <= A(11) AND B(11) after 5ns;
    G(12) <= A(12) AND B(12) after 5ns;
    G(13) <= A(13) AND B(13) after 5ns;
    G(14) <= A(14) AND B(14) after 5ns;
    G(15) <= A(15) AND B(15) after 5ns;
    G(16) <= A(16) AND B(16) after 5ns;
    G(17) <= A(17) AND B(17) after 5ns;
    G(18) <= A(18) AND B(18) after 5ns;
    G(19) <= A(19) AND B(19) after 5ns;
    G(20) <= A(20) AND B(20) after 5ns;
    G(21) <= A(21) AND B(21) after 5ns;
    G(22) <= A(22) AND B(22) after 5ns;
    G(23) <= A(23) AND B(23) after 5ns;
    G(24) <= A(24) AND B(24) after 5ns;
    G(25) <= A(25) AND B(25) after 5ns;
    G(26) <= A(26) AND B(26) after 5ns;
    G(27) <= A(27) AND B(27) after 5ns;
    G(28) <= A(28) AND B(28) after 5ns;
    G(29) <= A(29) AND B(29) after 5ns;
    G(30) <= A(30) AND B(30) after 5ns;
    G(31) <= A(31) AND B(31) after 5ns;
    
    --carry
    carry(0)  <= carry_in after 5ns;
    carry(1)  <= G(0)  OR (P(0)  AND carry(0))  after 5ns;
    carry(2)  <= G(1)  OR (P(1)  AND carry(1))  after 5ns;
    carry(3)  <= G(2)  OR (P(2)  AND carry(2))  after 5ns;
    carry(4)  <= G(3)  OR (P(3)  AND carry(3))  after 5ns;
    carry(5)  <= G(4)  OR (P(4)  AND carry(4))  after 5ns;
    carry(6)  <= G(5)  OR (P(5)  AND carry(5))  after 5ns;
    carry(7)  <= G(6)  OR (P(6)  AND carry(6))  after 5ns;
    carry(8)  <= G(7)  OR (P(7)  AND carry(7))  after 5ns;
    carry(9)  <= G(8)  OR (P(8)  AND carry(8))  after 5ns;
    carry(10) <= G(9)  OR (P(9)  AND carry(9))  after 5ns;
    carry(11) <= G(10) OR (P(10) AND carry(10)) after 5ns;
    carry(12) <= G(11) OR (P(11) AND carry(11)) after 5ns;
    carry(13) <= G(12) OR (P(12) AND carry(12)) after 5ns;
    carry(14) <= G(13) OR (P(13) AND carry(13)) after 5ns;
    carry(15) <= G(14) OR (P(14) AND carry(14)) after 5ns;
    carry(16) <= G(15) OR (P(15) AND carry(15)) after 5ns;
    carry(17) <= G(16) OR (P(16) AND carry(16)) after 5ns;
    carry(18) <= G(17) OR (P(17) AND carry(17)) after 5ns;
    carry(19) <= G(18) OR (P(18) AND carry(18)) after 5ns;
    carry(20) <= G(19) OR (P(19) AND carry(19)) after 5ns;
    carry(21) <= G(20) OR (P(20) AND carry(20)) after 5ns;
    carry(22) <= G(21) OR (P(21) AND carry(21)) after 5ns;
    carry(23) <= G(22) OR (P(22) AND carry(22)) after 5ns;
    carry(24) <= G(23) OR (P(23) AND carry(23)) after 5ns;
    carry(25) <= G(24) OR (P(24) AND carry(24)) after 5ns;
    carry(26) <= G(25) OR (P(25) AND carry(25)) after 5ns;
    carry(27) <= G(26) OR (P(26) AND carry(26)) after 5ns;
    carry(28) <= G(27) OR (P(27) AND carry(27)) after 5ns;
    carry(29) <= G(28) OR (P(28) AND carry(28)) after 5ns;
    carry(30) <= G(29) OR (P(29) AND carry(29)) after 5ns;
    carry(31) <= G(30) OR (P(30) AND carry(30)) after 5ns;

    --sum
    total_sum(0)  <= P(0)  XOR carry(0)  after 5ns;
    total_sum(1)  <= P(1)  XOR carry(1)  after 5ns;
    total_sum(2)  <= P(2)  XOR carry(2)  after 5ns;
    total_sum(3)  <= P(3)  XOR carry(3)  after 5ns;
    total_sum(4)  <= P(4)  XOR carry(4)  after 5ns;
    total_sum(5)  <= P(5)  XOR carry(5)  after 5ns;
    total_sum(6)  <= P(6)  XOR carry(6)  after 5ns;
    total_sum(7)  <= P(7)  XOR carry(7)  after 5ns;
    total_sum(8)  <= P(8)  XOR carry(8)  after 5ns;
    total_sum(9)  <= P(9)  XOR carry(9)  after 5ns;
    total_sum(10) <= P(10) XOR carry(10) after 5ns;
    total_sum(11) <= P(11) XOR carry(11) after 5ns;
    total_sum(12) <= P(12) XOR carry(12) after 5ns;
    total_sum(13) <= P(13) XOR carry(13) after 5ns;
    total_sum(14) <= P(14) XOR carry(14) after 5ns;
    total_sum(15) <= P(15) XOR carry(15) after 5ns;
    total_sum(16) <= P(16) XOR carry(16) after 5ns;
    total_sum(17) <= P(17) XOR carry(17) after 5ns;
    total_sum(18) <= P(18) XOR carry(18) after 5ns;
    total_sum(19) <= P(19) XOR carry(19) after 5ns;
    total_sum(20) <= P(20) XOR carry(20) after 5ns;
    total_sum(21) <= P(21) XOR carry(21) after 5ns;
    total_sum(22) <= P(22) XOR carry(22) after 5ns;
    total_sum(23) <= P(23) XOR carry(23) after 5ns;
    total_sum(24) <= P(24) XOR carry(24) after 5ns;
    total_sum(25) <= P(25) XOR carry(25) after 5ns;
    total_sum(26) <= P(26) XOR carry(26) after 5ns;
    total_sum(27) <= P(27) XOR carry(27) after 5ns;
    total_sum(28) <= P(28) XOR carry(28) after 5ns;
    total_sum(29) <= P(29) XOR carry(29) after 5ns;
    total_sum(30) <= P(30) XOR carry(30) after 5ns;
    total_sum(31) <= P(31) XOR carry(31) after 5ns;  
    
    final_sum <= total_sum;
    carry_out <= carry(31);
    overflow <= carry(31) XOR carry(30);
end Behavioral;

