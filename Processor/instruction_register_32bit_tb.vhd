----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: instruction_register_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_register_32bit_tb is
end instruction_register_32bit_tb;

architecture Behavioral of instruction_register_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component instruction_register_32bit
     Port( 
          instruction : in std_logic_vector(31 downto 0);
          IL : in std_logic;
          Clk : in std_logic;
          opcode : out std_logic_vector(16 downto 0);
          DR, SA, SB : out std_logic_vector(4 downto 0)
          );
    end component;
    
    --Inputs
    signal instruction : std_logic_vector(31 downto 0);
    signal IL : std_logic;
    signal Clk : std_logic := '1';
    
    --Outputs
    signal opcode : std_logic_vector(16 downto 0);
    signal DR : std_logic_vector(4 downto 0);
    signal SA : std_logic_vector(4 downto 0);
    signal SB : std_logic_vector(4 downto 0);
    
begin
   --Instantiate the Unit Under Test (UUT)
   uut : instruction_register_32bit PORT MAP
   (
        instruction => instruction,
        IL => IL,
        Clk => Clk,
        opcode => opcode,
        DR => DR,
        SA => SA,
        SB => SB
    );
    
   Clk <= NOT Clk after 10ns;
   stim_proc: process
   begin
        --test whether outputs have correct values when register loaded	
        IL <= '1';
        instruction <= "11111111111111111"&"00000"&"00001"&"00010";
        wait for 20ns;
        instruction <= "00000000111111111"&"00101"&"00110"&"00111";
        wait for 20ns;
        
        --test when register shouldn't be loaded
        IL <= '0';
        instruction <= "11111111111111111"&"11111"&"11111"&"11111";
        wait;
   end process;
end Behavioral;