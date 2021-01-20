----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 02.01.2021 23:49:58
-- Module Name: function_unit_32bit_CLA_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity function_unit_32bit_CLA_tb is
end function_unit_32bit_CLA_tb;

architecture Behavioral of function_unit_32bit_CLA_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component function_unit_32bit_CLA 
     Port(
          A, B : in std_logic_vector(31 downto 0);
          FS : in std_logic_vector(4 downto 0);
          V, C, N, Z : out std_logic;
          F : out std_logic_vector(31 downto 0)
          );
    end component;
        
    --Inputs
    signal A : std_logic_vector(31 downto 0) := x"0000FFFF";
    signal B : std_logic_vector(31 downto 0) := x"FFFF0000";
    signal FS : std_logic_vector(4 downto 0);
    
    --Outputs
    signal V : std_logic;
    signal C : std_logic;
    signal N : std_logic;
    signal Z : std_logic;
    signal F : std_logic_vector(31 downto 0);

begin
   --Instantiate the Unit Under Test (UUT)
   uut : function_unit_32bit_CLA PORT MAP
   (
        A => A,
        B => B,
        FS => FS,
        V => V,
        C => C,
        N => N,
        Z => Z,
        F => F
    );
    
   stim_proc: process
   begin
        -- test arithmetic operations
        FS <= "00000";      --F = A
        wait for 170ns;
        FS <= "00001";      --F = A + 1     
        wait for 170ns;
        FS <= "00010";      --F = A + B
        wait for 170ns;
        FS <= "00011";      --F = A + B + 1
        wait for 170ns;
        FS <= "00100";      --F = A + NOT B
        wait for 170ns;
        FS <= "00101";      --F = A + NOT B + 1
        wait for 170ns;
        FS <= "00110";      --F = A - 1
        wait for 170ns;
        FS <= "00111";      --F = A
        wait for 170ns;

        -- test logic operations
        FS <= "01000";      --F = A AND B
        wait for 20ns;
        FS <= "01010";      --F = A OR B
        wait for 20ns;
        FS <= "01100";      --F = A XOR B
        wait for 20ns;
        FS <= "01110";      --F = NOT A
        wait for 20ns;
        
        -- test shifter
        FS <= "10000";      --F = B
        wait for 20ns;
        FS <= "10100";      --F = sr B
        wait for 20ns;      
        FS <= "11000";      --F = sl B
        wait;
   end process;
end Behavioral;
