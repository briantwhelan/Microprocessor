----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: zero_fill_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_fill_32bit is
 Port(
      input : in std_logic_vector(4 downto 0);
      output : out std_logic_vector(31 downto 0)
      );
end zero_fill_32bit;

architecture Behavioral of zero_fill_32bit is
begin
    output <= "000000000000000000000000000" & input after 5ns;
end Behavioral;

