----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 14.11.2020 15:49:15
-- Module Name: alu_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_32bit_tb is
end alu_32bit_tb;

architecture Behavioral of alu_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component alu_32bit 
     Port(
          A, B : in std_logic_vector(31 downto 0);
          c_in : in std_logic;
          sel : in std_logic_vector(1 downto 0);
          mode : in std_logic;
          G : out std_logic_vector(31 downto 0);
          c_out, v : out std_logic
          );
    end component;
        
    --Inputs
    signal A : std_logic_vector(31 downto 0) := x"0000FFFF";
    signal B : std_logic_vector(31 downto 0) := x"FFFF0000";
    signal c_in : std_logic;
    signal sel : std_logic_vector(1 downto 0);
    signal mode : std_logic;
    
    --Outputs
    signal G : std_logic_vector(31 downto 0);
    signal c_out : std_logic;
    signal v : std_logic;

begin
   --Instantiate the Unit Under Test (UUT)
   uut : alu_32bit PORT MAP
   (
        A => A,
        B => B,
        c_in => c_in,
        sel => sel,
        mode => mode,
        G => G,
        c_out => c_out,
        v => v
    );
    
   stim_proc: process
   begin
        --test arithmetic circuit
        mode <= '0';
        c_in <= '0';
        sel <= "00";
        wait for 350ns;
        sel <= "01";
        wait for 350ns;  
        sel <= "10";
        wait for 350ns; 
        sel <= "11";
        wait for 350ns; 		
        
        c_in <= '1';
        sel <= "00";
        wait for 350ns;
        sel <= "01";
        wait for 350ns;  
        sel <= "10";
        wait for 350ns; 
        sel <= "11";
        wait for 350ns; 
        
        --test logic unit
        mode <= '1';
        sel <= "00";
        wait for 20ns;
        sel <= "01";
        wait for 20ns;  
        sel <= "10";
        wait for 20ns; 
        sel <= "11";
        wait; 		
   end process;
end Behavioral;
