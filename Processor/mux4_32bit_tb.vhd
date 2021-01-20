----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 11.11.2020 10:36:30
-- Module Name: mux4_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_32bit_tb is
end mux4_32bit_tb;

architecture Behavioral of mux4_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component mux4_32bit
     Port(
          in0, in1, in2, in3 : in std_logic_vector(31 downto 0);
          s : in std_logic_vector(1 downto 0);
          output : out std_logic_vector(31 downto 0) 
          );
    end component;
    
    --Inputs
    signal in0 : std_logic_vector(31 downto 0) := x"000000FF";
    signal in1 : std_logic_vector(31 downto 0) := x"0000FF00";
    signal in2 : std_logic_vector(31 downto 0) := x"00FF0000";
    signal in3 : std_logic_vector(31 downto 0) := x"FF000000";
    signal s : std_logic_vector(1 downto 0) := "00";
    
    --Outputs
    signal output : std_logic_vector(31 downto 0);

begin
   --Instantiate the Unit Under Test (UUT)
   uut : mux4_32bit PORT MAP
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
       