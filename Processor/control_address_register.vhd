----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 19:47:11
-- Module Name: control_address_register - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_address_register is
 Port(
       reset : in std_logic;
       input : in std_logic_vector(16 downto 0);
       load : in std_logic;
       Clk : in std_logic;
       address : inout std_logic_vector(16 downto 0) 
      );
end control_address_register;

architecture Behavioral of control_address_register is
begin
    process(Clk)
    begin
        if(reset = '1') then
            address <= "00000000000010000";
        else
            if(rising_edge(Clk)) then
                if(load = '1') then 
                    address <= input after 5ns;
                else
                    address <= address + 1 after 5ns;
                end if;
            end if;
        end if;
    end process;
end Behavioral;