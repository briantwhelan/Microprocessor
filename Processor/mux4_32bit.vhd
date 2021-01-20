----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 11.11.2020 10:36:30
-- Module Name: mux4_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux4_32bit is
 Port(
      in0, in1, in2, in3 : in std_logic_vector(31 downto 0);
      s : in std_logic_vector(1 downto 0);
      output : out std_logic_vector(31 downto 0)
      );    
end mux4_32bit;

architecture Behavioral of mux4_32bit is
begin
    output <= in0 after 5ns when s = "00" else
              in1 after 5ns when s = "01" else
              in2 after 5ns when s = "10" else
              in3 after 5ns when s = "11" else
              x"00000000" after 5ns;
end Behavioral;