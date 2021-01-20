----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 26.10.2020 11:52:30
-- Module Name: register_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_32bit_tb is
end register_32bit_tb;

architecture Behavioral of register_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component register_32bit
     Port(
          D : in std_logic_vector(31 downto 0);
          load, Clk : in std_logic;
          Q : out std_logic_vector(31 downto 0)  
          );
    end component;
    
    --Inputs
    signal D : std_logic_vector(31 downto 0);
    signal load : std_logic;
    signal Clk : std_logic := '0';
    
    --Outputs
    signal Q : std_logic_vector(31 downto 0);

begin
   --Instantiate the Unit Under Test (UUT)
   uut : register_32bit PORT MAP
   (
        D => D,
        load => load,
        Clk => Clk,
        Q => Q
    );
    
   Clk <= NOT Clk after 10ns;
   stim_proc: process
   begin
        --test loading register with value
        D <= x"12345678";
        load <= '0';
        wait for 20ns;
        load <= '1';
        wait for 20ns;
        
        D <= x"87654321";
        load <= '0';
        wait for 20ns;
        load <= '1';
        wait;    		
   end process;
end Behavioral;
       