----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: zero_fill_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_fill_32bit_tb is
end zero_fill_32bit_tb;

architecture Behavioral of zero_fill_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component zero_fill_32bit
     Port( 
          input : in std_logic_vector(4 downto 0);
          output : out std_logic_vector(31 downto 0)
          );
    end component;
    
    --Inputs
    signal input : std_logic_vector(4 downto 0);
    
    --Outputs
    signal output : std_logic_vector(31 downto 0);
    
begin
   --Instantiate the Unit Under Test (UUT)
   uut : zero_fill_32bit PORT MAP
   (
        input => input,
        output => output
    );
    
   stim_proc: process
   begin	
        --test output for different inputs
        input <= "01111";
        wait for 10ns;
        input <= "01010";
        wait;
   end process;
end Behavioral;