----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 02.01.2021 23:49:58
-- Module Name: arithmetic_circuit_32bit_CLA - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic_circuit_32bit_CLA is
 Port(
      A, B : in std_logic_vector(31 downto 0);
      c_in : in std_logic;
      sel : in std_logic_vector(1 downto 0);
      G : out std_logic_vector(31 downto 0);
      c_out, v : out std_logic
      );
end arithmetic_circuit_32bit_CLA;

architecture Behavioral of arithmetic_circuit_32bit_CLA is
    --components
    component carry_lookahead_adder_32bit 
     Port(
          A, B : in std_logic_vector (31 downto 0);
          carry_in : in std_logic;
          final_sum : out std_logic_vector (31 downto 0);
          carry_out : out std_logic;
          overflow : out std_logic
          );
    end component;
    
    --signals
    signal Y : std_logic_vector (31 downto 0);
   
begin    
    --B input logic
    Y <= x"00000000" after 5ns when sel = "00" else
         B           after 5ns when sel = "01" else
         (NOT B)     after 5ns when sel = "10" else
         x"FFFFFFFF" after 5ns when sel = "11" else
         x"00000000" after 5ns;
     
    -- port maps
    carryLookaheadAdder32 : carry_lookahead_adder_32bit PORT MAP
    (
        A => A,  
        B => Y,
        carry_in => c_in,
        final_sum => G,
        carry_out => c_out,
        overflow => v
    );
end Behavioral;
