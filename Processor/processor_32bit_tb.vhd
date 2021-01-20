----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 17.12.2020 21:05:07
-- Module Name: processor_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor_32bit_tb is
end processor_32bit_tb;

architecture Behavioral of processor_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component processor_32bit 
     Port(
          reset : in std_logic;
          Clk : in std_logic
          );
    end component;
        
    --Inputs
    signal reset : std_logic;
    signal Clk : std_logic := '1';
    
begin
   --Instantiate the Unit Under Test (UUT)
   uut : processor_32bit PORT MAP
   (
        reset => reset,
        Clk => Clk
    );
    
   Clk <= not Clk after 200ns;
   stim_proc: process
   begin 
        --test resetting program
        reset <= '1';
        wait for 400ns;
        
        --test program in memory which contains instruction set
        reset <= '0';
        wait;
   end process;
end Behavioral;