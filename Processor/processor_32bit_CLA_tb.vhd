----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 02.01.2021 23:49:58
-- Module Name: processor_32bit_CLA_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor_32bit_CLA_tb is
end processor_32bit_CLA_tb;

architecture Behavioral of processor_32bit_CLA_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component processor_32bit_CLA 
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
   uut : processor_32bit_CLA PORT MAP
   (
        reset => reset,
        Clk => Clk
    );
    
   Clk <= not Clk after 100ns;
   stim_proc: process
   begin 
        --test resetting program
        reset <= '1';
        wait for 200ns;
        
        --test program in memory which contains instruction set
        reset <= '0';
        wait;
   end process;
end Behavioral;
