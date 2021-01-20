----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 14.11.2020 16:27:18
-- Module Name: mux4_1bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1bit_tb is
end mux4_1bit_tb;

architecture Behavioral of mux4_1bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component mux4_1bit
     Port(
          in0, in1, in2, in3 : in std_logic;
          s : in std_logic_vector(1 downto 0);
          output : out std_logic
          );
    end component;
    
    --Inputs
    signal in0 : std_logic := '1';
    signal in1 : std_logic := '0';
    signal in2 : std_logic := '1';
    signal in3 : std_logic := '0';
    signal s : std_logic_vector(1 downto 0) := "00";
    
    --Outputs
    signal output : std_logic;

begin
   --Instantiate the Unit Under Test (UUT)
   uut : mux4_1bit PORT MAP
   (
        in0 => in0,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        s => s,
        output => output
    );
    
   stim_proc: process
   begin
        --test output for different selects
        s <= "00";
        wait for 10ns;
        s <= "01";
        wait for 10ns;  
        s <= "10";
        wait for 10ns; 
        s <= "11";
        wait; 		
   end process;
end Behavioral;
       