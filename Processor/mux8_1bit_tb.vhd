----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: mux8_1bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_1bit_tb is
end mux8_1bit_tb;

architecture Behavioral of mux8_1bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component mux8_1bit
     Port(
          in0, in1,in2, in3, in4, in5, in6, in7 : in std_logic;
          s : in std_logic_vector(2 downto 0);
          output : out std_logic
          );
    end component;
    
    --Inputs
    signal in0 : std_logic := '1';
    signal in1 : std_logic := '1';
    signal in2 : std_logic := '1';
    signal in3 : std_logic := '1';
    signal in4 : std_logic := '0';
    signal in5 : std_logic := '0';
    signal in6 : std_logic := '0';
    signal in7 : std_logic := '0';
    signal s : std_logic_vector(2 downto 0);
    
    --Outputs
    signal output : std_logic;

begin
   --Instantiate the Unit Under Test (UUT)
   uut : mux8_1bit PORT MAP
   (
        in0 => in0,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        in4 => in4,
        in5 => in5,
        in6 => in6,
        in7 => in7,
        s => s,
        output => output
    );
    
   stim_proc: process
   begin
        --test output for different selects 
        s <= "000";
        wait for 10ns;
        s <= "001";
        wait for 10ns;  
        s <= "010";
        wait for 10ns; 
        s <= "011";
        wait for 10ns;
        s <= "100";
        wait for 10ns;
        s <= "101";
        wait for 10ns;  
        s <= "110";
        wait for 10ns; 
        s <= "111";
        wait;  		
   end process;
end Behavioral;
       

