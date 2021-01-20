----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: mux8_1bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux8_1bit is
 Port(
      in0, in1,in2, in3, in4, in5, in6, in7 : in std_logic;
      s : in std_logic_vector(2 downto 0);
      output : out std_logic
     );
end mux8_1bit;

architecture Behavioral of mux8_1bit is
begin
    output <= in0 after 5ns when s = "000" else
              in1 after 5ns when s = "001" else
              in2 after 5ns when s = "010" else
              in3 after 5ns when s = "011" else
              in4 after 5ns when s = "100" else
              in5 after 5ns when s = "101" else
              in6 after 5ns when s = "110" else
              in7 after 5ns when s = "111" else
              '0' after 5ns;
end Behavioral;