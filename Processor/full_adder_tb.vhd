----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 02.11.2020 15:39:46
-- Module Name: full_adder_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component full_adder
     Port(
          in0, in1 : in std_logic;
          c_in : in std_logic;
          sum, c_out : out std_logic
          );
    end component;
    
    --Inputs
    signal in0 : std_logic := '0';
    signal in1 : std_logic := '0';
    signal c_in : std_logic := '0';
    
    --Outputs
    signal sum : std_logic;
    signal c_out : std_logic;

begin
   --Instantiate the Unit Under Test (UUT)
   uut : full_adder PORT MAP
   (
        in0 => in0,
        in1 => in1,
        c_in => c_in,
        sum => sum,
        c_out => c_out
    );
    
   stim_proc: process
   begin
        --test for when carry_in is 0
        c_in <= '0';
        in0 <= '0';
        in1 <= '0';
        wait for 10ns;
        in0 <= '0';
        in1 <= '1';
        wait for 10ns;
        in0 <= '1';
        in1 <= '0';
        wait for 10ns;  	
        in0 <= '1';
        in1 <= '1';
        wait for 10ns;
        
        -- test for when carry_in is 1
        c_in <= '1';
        in0 <= '0';
        in1 <= '0';
        wait for 10ns;  
        in0 <= '0';
        in1 <= '1';
        wait for 10ns;  
        in0 <= '1';
        in1 <= '0';
        wait for 10ns;  
        in0 <= '1';
        in1 <= '1';
        wait;    	  		
   end process;
end Behavioral;
