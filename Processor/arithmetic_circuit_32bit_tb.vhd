----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 11.11.2020 10:33:15
-- Module Name: arithmetic_circuit_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arithmetic_circuit_32bit_tb is
end arithmetic_circuit_32bit_tb;

architecture Behavioral of arithmetic_circuit_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component arithmetic_circuit_32bit
     Port(
          A, B : in std_logic_vector(31 downto 0);
          c_in : in std_logic;
          sel : in std_logic_vector(1 downto 0);
          G : out std_logic_vector(31 downto 0);
          c_out, v : out std_logic
          );
    end component;
    
    --Inputs
    signal A : std_logic_vector(31 downto 0) := x"0000FFFF";
    signal B : std_logic_vector(31 downto 0) := x"FFFF0000";
    signal c_in : std_logic;
    signal sel : std_logic_vector(1 downto 0);
    
    --Outputs
    signal G : std_logic_vector(31 downto 0);
    signal c_out : std_logic;
    signal v : std_logic;

begin
   --Instantiate the Unit Under Test (UUT)
   uut : arithmetic_circuit_32bit PORT MAP
   (
        A => A,
        B => B,
        c_in => c_in,
        sel => sel,
        G => G,
        c_out => c_out,
        v => v
    );
    
   stim_proc: process
   begin
        --test when carry_in is 0
        c_in <= '0';
        sel <= "00";
        wait for 350ns;
        sel <= "01";
        wait for 350ns; 
        sel <= "10";
        wait for 350ns; 
        sel <= "11";
        wait for 350ns;		
        
        --test when carry_in is 1
        c_in <= '1';
        sel <= "00";
        wait for 350ns;
        sel <= "01";
        wait for 350ns;  
        sel <= "10";
        wait for 350ns;
        sel <= "11";
        wait;
   end process;
end Behavioral;
