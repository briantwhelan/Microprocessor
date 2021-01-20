----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: instruction_register_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instruction_register_32bit is
 Port(
      instruction : in std_logic_vector(31 downto 0);
      IL : in std_logic;
      Clk : in std_logic;
      opcode : out std_logic_vector(16 downto 0);
      DR, SA, SB : out std_logic_vector(4 downto 0)
      );
end instruction_register_32bit;

architecture Behavioral of instruction_register_32bit is
begin
    process(Clk)
    begin
        if(rising_edge(Clk)) then
            if(IL = '1') then 
                opcode <= instruction(31 downto 15) after 5ns;
                DR <= instruction(14 downto 10) after 5ns;
                SA <= instruction(9 downto 5) after 5ns;
                SB <= instruction(4 downto 0) after 5ns;
            end if;
        end if;
    end process;    
end Behavioral;