----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: program_counter_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter_32bit_tb is
end program_counter_32bit_tb;

architecture Behavioral of program_counter_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component program_counter_32bit
     Port( 
          extend : in std_logic_vector(31 downto 0);
          reset : in std_logic;
          PL, PI : in std_logic;
          Clk : in std_logic;
          pc : inout std_logic_vector(31 downto 0)
          );
    end component;
    
    --Inputs
    signal extend : std_logic_vector(31 downto 0);
    signal reset : std_logic;
    signal PL : std_logic;
    signal PI : std_logic;
    signal Clk : std_logic := '1';
    
    --Outputs
    signal pc : std_logic_vector(31 downto 0);
begin
   --Instantiate the Unit Under Test (UUT)
   uut : program_counter_32bit PORT MAP
   (
        extend => extend,
        reset => reset,
        PL => PL,
        PI => PI,
        Clk => Clk,
        pc => pc
    );
    
   Clk <= NOT Clk after 200ns;
   stim_proc: process
   begin	
        --test resetting program counter to starting address in memory
        reset <= '1'; 
        wait for 400ns;
        
        --test incrementing current program counter to advance in memory
        reset <= '0';
        extend <= x"00000004";
        PL <= '0';
        PI <= '1';
        wait for 400ns;
        
        --test adding extend to current program counter to jump in memory
        extend <= x"00000005";
        PL <= '1';
        PI <= '0';
        wait for 400ns;
        
        --remove load signal
        PL <= '0';
        wait;       
   end process;
end Behavioral;