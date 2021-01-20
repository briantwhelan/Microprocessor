----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 26.10.2020 11:52:30
-- Module Name: register_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_32bit is
 Port(
      D : in std_logic_vector(31 downto 0);
      load, Clk : in std_logic;
      Q : out std_logic_vector(31 downto 0)
      );    
end register_32bit;

architecture Behavioral of register_32bit is
begin
    process(Clk)
    begin
        if(rising_edge(Clk)) then
            if(load = '1') then 
                Q <= D after 5ns;
            end if;
        end if;
    end process;
end Behavioral;
