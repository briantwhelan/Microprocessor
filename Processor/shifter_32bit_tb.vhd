----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 14.11.2020 16:27:18
-- Module Name: shifter_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter_32bit_tb is
end shifter_32bit_tb;

architecture Behavioral of shifter_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component shifter_32bit 
     Port(
          B : in std_logic_vector(31 downto 0);
          s : in std_logic_vector(1 downto 0);
          IL, IR : in std_logic;
          H : out std_logic_vector(31 downto 0) 
          );
    end component;
        
    --Inputs
    signal B : std_logic_vector(31 downto 0) := x"00FFFF00";
    signal s : std_logic_vector(1 downto 0);
    signal IL : std_logic;
    signal IR : std_logic;
    
    --Outputs
    signal H : std_logic_vector(31 downto 0);

begin
   --Instantiate the Unit Under Test (UUT)
   uut : shifter_32bit PORT MAP
   (
        B => B,
        s => s,
        IL => IL,
        IR => IR,
        H => H
    );
    
   stim_proc: process
   begin
        --test all possible shifts when IL and IR are 0
        IL <= '0';
        IR <= '0';
        s <= "00";
        wait for 10ns;
        s <= "01";
        wait for 10ns;
        s <= "10";
        wait for 10ns;
        s <= "11";
        wait for 10ns;
        
        --test all possible shifts when IL and IR are 1
        IL <= '1';
        IR <= '1';
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
