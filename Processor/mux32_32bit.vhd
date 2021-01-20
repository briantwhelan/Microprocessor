----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 26.10.2020 11:52:30
-- Module Name: mux32_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux32_32bit is
 Port(
      in0, in1, in2 ,in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31 : in std_logic_vector(31 downto 0);
      s : in std_logic_vector(4 downto 0);
      output : out std_logic_vector(31 downto 0)
      );
end mux32_32bit;

architecture Behavioral of mux32_32bit is
begin
    output <= in0 after 5ns when s = "00000" else
              in1 after 5ns when s = "00001" else
              in2 after 5ns when s = "00010" else
              in3 after 5ns when s = "00011" else
              in4 after 5ns when s = "00100" else
              in5 after 5ns when s = "00101" else
              in6 after 5ns when s = "00110" else
              in7 after 5ns when s = "00111" else
              in8 after 5ns when s = "01000" else
              in9 after 5ns when s = "01001" else
              in10 after 5ns when s = "01010" else
              in11 after 5ns when s = "01011" else
              in12 after 5ns when s = "01100" else
              in13 after 5ns when s = "01101" else
              in14 after 5ns when s = "01110" else
              in15 after 5ns when s = "01111" else
              in16 after 5ns when s = "10000" else
              in17 after 5ns when s = "10001" else
              in18 after 5ns when s = "10010" else
              in19 after 5ns when s = "10011" else
              in20 after 5ns when s = "10100" else
              in21 after 5ns when s = "10101" else
              in22 after 5ns when s = "10110" else
              in23 after 5ns when s = "10111" else
              in24 after 5ns when s = "11000" else
              in25 after 5ns when s = "11001" else
              in26 after 5ns when s = "11010" else
              in27 after 5ns when s = "11011" else
              in28 after 5ns when s = "11100" else
              in29 after 5ns when s = "11101" else
              in30 after 5ns when s = "11110" else
              in31 after 5ns when s = "11111" else
              x"00000000" after 5ns;
end Behavioral;
