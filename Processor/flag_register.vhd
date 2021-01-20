----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: flag_register - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flag_register is
 Port(
      Z, N, C, V : in std_logic;
      FL, RZ, RN, RC, RV : in std_logic;
      Clk : in std_logic;
      flags : out std_logic_vector(3 downto 0)
      );
end flag_register;

architecture Behavioral of flag_register is
begin
    process(Clk)
    begin
        if(rising_edge(Clk)) then
            if(RZ = '1') then
                flags(0) <= '0' after 5ns;
            end if;
            if(RN = '1') then
                flags(1) <= '0' after 5ns;
            end if;
            if(RC = '1') then
                flags(2) <= '0' after 5ns;
            end if;    
            if(RV = '1') then
                flags(3) <= '0' after 5ns;
            end if;
                
            if(FL = '1') then 
                flags <= V & C & N & Z after 5ns;
            end if;
        end if;
    end process;
end Behavioral;

