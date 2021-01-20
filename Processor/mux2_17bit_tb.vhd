----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 20:12:27
-- Module Name: mux2_17bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_17bit_tb is
end mux2_17bit_tb;

architecture Behavioral of mux2_17bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component mux2_17bit
     Port(
          in0, in1 : in std_logic_vector(16 downto 0);
          s : in std_logic;
          output : out std_logic_vector(16 downto 0) 
          );
    end component;
    
    --Inputs
    signal in0 : std_logic_vector(16 downto 0) := '0' & x"1234";
    signal in1 : std_logic_vector(16 downto 0) := '0' & x"abcd";
    signal s : std_logic := '0';
    
    --Outputs
    signal output : std_logic_vector(16 downto 0);

begin
   --Instantiate the Unit Under Test (UUT)
   uut : mux2_17bit PORT MAP
   (
        in0 => in0,
        in1 => in1,
        s => s,
        output => output
    );
    
   stim_proc: process
   begin
        --test output for different selects
        s <= '0';
        wait for 10ns;
        s <= '1';
        wait;  		
   end process;
end Behavioral;
       
