----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: extend_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity extend_32bit is
 Port(
      input : in std_logic_vector(9 downto 0);
      output : out std_logic_vector(31 downto 0)
      );
end extend_32bit;

architecture Behavioral of extend_32bit is
begin
    output <= "1111111111111111111111" & input after 5ns when input(9) = '1' else
              "0000000000000000000000" & input after 5ns when input(9) = '0' else
              x"00000000";
end Behavioral;