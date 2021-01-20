----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 12.12.2020 20:42:53
-- Module Name: memory_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory_32bit_tb is
end memory_32bit_tb;

architecture Behavioral of memory_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component memory_32bit 
     Port(
          address : in std_logic_vector(31 downto 0); 
          data_in : in std_logic_vector(31 downto 0);
          MW : in std_logic;
          Clk : in std_logic;
          data_out : out std_logic_vector(31 downto 0)   
         );
    end component;
        
    --Inputs
    signal address : std_logic_vector(31 downto 0);
    signal data_in : std_logic_vector(31 downto 0);
    signal MW : std_logic;
    signal Clk : std_logic := '1';
    
    --Outputs
    signal data_out : std_logic_vector(31 downto 0);

begin
   --Instantiate the Unit Under Test (UUT)
   uut : memory_32bit PORT MAP
   (
        address => address,
        data_in => data_in,
        MW => MW,
        Clk => Clk,
        data_out => data_out
    );
    
    Clk <= not Clk after 10ns;
    stim_proc: process
    begin 
        --test loading memory with data
        MW <= '1';
        data_in <= x"0000000F";
        address <= x"00000100";
        wait for 20ns;
        
        data_in <= x"000000F0";
        address <= x"00000101";
        wait for 20ns;
        
        data_in <= x"00000F00";
        address <= x"00000102";
        wait for 20ns;
        
        data_in <= x"0000F000";
        address <= x"00000103";
        wait for 20ns;
        
        data_in <= x"000F0000";
        address <= x"00000104";
        wait for 20ns;
        
        data_in <= x"00F00000";
        address <= x"00000105";
        wait for 20ns;
        
        data_in <= x"0F000000";
        address <= x"00000106";
        wait for 20ns;
        
        data_in <= x"F0000000";
        address <= x"00000107";
        wait for 20ns;
        
        data_in <= x"AAAAAAAA";
        address <= x"00000108";
        wait for 20ns;
        
        data_in <= x"BBBBBBBB";
        address <= x"00000109";
        wait for 20ns;
        
        --test reading loaded values from memory
        MW <= '0';
        address <= x"00000100";
        wait for 20ns;
        
        address <= x"00000101";
        wait for 20ns;
        
        address <= x"00000102";
        wait for 20ns;
        
        address <= x"00000103";
        wait for 20ns;
        
        address <= x"00000104";
        wait for 20ns;
        
        address <= x"00000105";
        wait for 20ns;
        
        address <= x"00000106";
        wait for 20ns;
        
        address <= x"00000107";
        wait for 20ns;
        
        address <= x"00000108";
        wait for 20ns;
        
        address <= x"00000109";
        wait;
    end process;
end Behavioral;
