----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 26.10.2020 11:52:30
-- Module Name: mux32_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux32_32bit_tb is
end mux32_32bit_tb;

architecture Behavioral of mux32_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component mux32_32bit
     Port(
          in0, in1, in2 ,in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31 : in std_logic_vector(31 downto 0);
          s: in std_logic_vector(4 downto 0);
          output : out std_logic_vector(31 downto 0)
          );
    end component;
    
    --Inputs
    signal in0 : std_logic_vector(31 downto 0) := x"00000007";
    signal in1 : std_logic_vector(31 downto 0) := x"00000070";
    signal in2 : std_logic_vector(31 downto 0) := x"00000700";
    signal in3 : std_logic_vector(31 downto 0) := x"00007000";
    signal in4 : std_logic_vector(31 downto 0) := x"00070000";
    signal in5 : std_logic_vector(31 downto 0) := x"00700000";
    signal in6 : std_logic_vector(31 downto 0) := x"07000000";
    signal in7 : std_logic_vector(31 downto 0) := x"70000000";
    signal in8 : std_logic_vector(31 downto 0) := x"00000003";
    signal in9 : std_logic_vector(31 downto 0) := x"00000030";
    signal in10 : std_logic_vector(31 downto 0) := x"00000300";
    signal in11 : std_logic_vector(31 downto 0) := x"00003000";
    signal in12 : std_logic_vector(31 downto 0) := x"00030000";
    signal in13 : std_logic_vector(31 downto 0) := x"00300000";
    signal in14 : std_logic_vector(31 downto 0) := x"03000000";
    signal in15 : std_logic_vector(31 downto 0) := x"30000000";
    signal in16 : std_logic_vector(31 downto 0) := x"0000000C";
    signal in17 : std_logic_vector(31 downto 0) := x"000000C0";
    signal in18 : std_logic_vector(31 downto 0) := x"00000C00";
    signal in19 : std_logic_vector(31 downto 0) := x"0000C000";
    signal in20 : std_logic_vector(31 downto 0) := x"000C0000";
    signal in21 : std_logic_vector(31 downto 0) := x"00C00000";
    signal in22 : std_logic_vector(31 downto 0) := x"0C000000";
    signal in23 : std_logic_vector(31 downto 0) := x"C0000000";
    signal in24 : std_logic_vector(31 downto 0) := x"0000000F";
    signal in25 : std_logic_vector(31 downto 0) := x"000000F0";
    signal in26 : std_logic_vector(31 downto 0) := x"00000F00";
    signal in27 : std_logic_vector(31 downto 0) := x"0000F000";
    signal in28 : std_logic_vector(31 downto 0) := x"000F0000";
    signal in29 : std_logic_vector(31 downto 0) := x"00F00000";
    signal in30 : std_logic_vector(31 downto 0) := x"0F000000";
    signal in31 : std_logic_vector(31 downto 0) := x"F0000000";
    signal s : std_logic_vector(4 downto 0) := "00000";
    
    --Outputs
    signal output : std_logic_vector(31 downto 0);

begin
   --Instantiate the Unit Under Test (UUT)
   uut : mux32_32bit PORT MAP
   (
        in0 => in0,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        in4 => in4,
        in5 => in5,
        in6 => in6,
        in7 => in7,
        in8 => in8,
        in9 => in9,
        in10 => in10,
        in11 => in11,
        in12 => in12,
        in13 => in13,
        in14 => in14,
        in15 => in15,
        in16 => in16,
        in17 => in17,
        in18 => in18,
        in19 => in19,
        in20 => in20,
        in21 => in21,
        in22 => in22,
        in23 => in23,
        in24 => in24,
        in25 => in25,
        in26 => in26,
        in27 => in27,
        in28 => in28,
        in29 => in29,
        in30 => in30,
        in31 => in31,
        s => s,
        output => output
    );
    
   stim_proc: process
   begin
        --test output for different selects
        s <= "00000";
        wait for 10ns;
        s <= "00001";
        wait for 10ns;
        s <= "00010";
        wait for 10ns;
        s <= "00011";
        wait for 10ns;
        s <= "00100";
        wait for 10ns;
        s <= "00101";
        wait for 10ns;
        s <= "00110";
        wait for 10ns;
        s <= "00111";
        wait for 10ns;
        s <= "01000";
        wait for 10ns;
        s <= "01001";
        wait for 10ns;
        s <= "01010";
        wait for 10ns;
        s <= "01011";
        wait for 10ns;
        s <= "01100";
        wait for 10ns;
        s <= "01101";
        wait for 10ns;
        s <= "01110";
        wait for 10ns;
        s <= "01111";
        wait for 10ns;
        s <= "10000";
        wait for 10ns;
        s <= "10001";
        wait for 10ns;
        s <= "10010";
        wait for 10ns;
        s <= "10011";
        wait for 10ns;
        s <= "10100";
        wait for 10ns;
        s <= "10101";
        wait for 10ns;
        s <= "10110";
        wait for 10ns;
        s <= "10111";
        wait for 10ns;
        s <= "11000";
        wait for 10ns;
        s <= "11001";
        wait for 10ns;
        s <= "11010";
        wait for 10ns;
        s <= "11011";
        wait for 10ns;
        s <= "11100";
        wait for 10ns;
        s <= "11101";
        wait for 10ns;
        s <= "11110";
        wait for 10ns;
        s <= "11111";
        wait;		
   end process;
end Behavioral;