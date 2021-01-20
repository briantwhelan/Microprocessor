----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 04.11.2020 17:37:47
-- Module Name: ripple_adder_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder_32bit_tb is
end ripple_adder_32bit_tb;

architecture Behavioral of ripple_adder_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component ripple_adder_32bit
     Port(
          A, B : in std_logic_vector(31 downto 0);
          carry_in : in std_logic;
          final_sum : out std_logic_vector(31 downto 0);
          carry_out, overflow : out std_logic
          );
    end component;
    
    --Inputs
    signal A : std_logic_vector(31 downto 0) := x"0000FFFF";
    signal B : std_logic_vector(31 downto 0) := x"FFFF0000";
    signal carry_in : std_logic;
    
    --Outputs
    signal total_sum : std_logic_vector(31 downto 0);
    signal carry_out : std_logic;
    signal overflow : std_logic;

begin
   --Instantiate the Unit Under Test (UUT)
   uut : ripple_adder_32bit PORT MAP
   (
        A => A,
        B => B,
        carry_in => carry_in,
        final_sum => total_sum,
        carry_out => carry_out,
        overflow => overflow
    );
    
   stim_proc: process
   begin
        -- test for inputs with no carry_in (expecting sum = x"FFFFFFFF", c_out = '0' and overflow = '0')
        carry_in <= '0';
        wait for 400ns;
        -- test for inputs with carry_in (expecting sum = x"00000000", c_out = '1' and overflow = '0')
        carry_in <= '1';
        wait;
   end process;
end Behavioral;
