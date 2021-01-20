----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 26.10.2020 11:52:30
-- Module Name: mux2_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2_32bit is
 Port(
      in0, in1 : in std_logic_vector(31 downto 0);
      s : in std_logic;
      output : out std_logic_vector(31 downto 0)
      );    
end mux2_32bit;

architecture Behavioral of mux2_32bit is
begin
    output <= in0 after 5ns when s = '0' else
              in1 after 5ns when s = '1' else
              x"00000000" after 5ns;
end Behavioral;
