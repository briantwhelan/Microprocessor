----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: extend_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity extend_32bit_tb is
end extend_32bit_tb;

architecture Behavioral of extend_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component extend_32bit
     Port( 
          input : in std_logic_vector(9 downto 0);
          output : out std_logic_vector(31 downto 0)
          );
    end component;
    
    --Inputs
    signal input : std_logic_vector(9 downto 0);
    
    --Outputs
    signal output : std_logic_vector(31 downto 0);
    
begin
   --Instantiate the Unit Under Test (UUT)
   uut : extend_32bit PORT MAP
   (
        input => input,
        output => output
    );
    
   stim_proc: process
   begin	
        --test sign-extending 10bit values to 32bit values
        input <= "1111111111";
        wait for 10ns;
        
        input <= "0000000001";
        wait for 10ns;
        
        input <= "1010101010";
        wait for 10ns;
        
        input <= "0101010101";
        wait;
   end process;
end Behavioral;