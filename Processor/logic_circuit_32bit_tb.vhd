----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 11.11.2020 10:33:15
-- Module Name: logic_circuit_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_circuit_32bit_tb is
end logic_circuit_32bit_tb;

architecture Behavioral of logic_circuit_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component logic_circuit_32bit
     Port(
          A, B : in std_logic_vector(31 downto 0);
          sel : in std_logic_vector(1 downto 0);
          G : out std_logic_vector(31 downto 0)
          );
    end component;
    
    --Inputs
    signal A : std_logic_vector(31 downto 0) := x"11111111";
    signal B : std_logic_vector(31 downto 0) := x"BBBBBBBB";
    signal sel : std_logic_vector(1 downto 0) := "00";
    
    --Outputs
    signal G : std_logic_vector(31 downto 0);

begin
   --Instantiate the Unit Under Test (UUT)
   uut : logic_circuit_32bit PORT MAP
   (
        A => A,
        B => B,
        sel => sel,
        G => G
    );
    
   stim_proc: process
   begin
        --test output for different selects
        sel <= "00";
        wait for 10ns;
        sel <= "01";
        wait for 10ns;  
        sel <= "10";
        wait for 10ns; 
        sel <= "11";
        wait; 		
   end process;
end Behavioral;
