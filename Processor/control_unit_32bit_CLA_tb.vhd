----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 02.01.2021 23:49:58
-- Module Name: control_unit_32bit_CLA_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit_32bit_CLA_tb is
end control_unit_32bit_CLA_tb;

architecture Behavioral of control_unit_32bit_CLA_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component control_unit_32bit_CLA
     Port(
          reset : in std_logic;
          instruction : in std_logic_vector(31 downto 0);
          V, C, N, Z : in std_logic;
          Clk : in std_logic;
          DR, SA, SB : out std_logic_vector(4 downto 0);
          TD, TA, TB : out std_logic;
          MB, MD, RW, MM, MW : out std_logic;
          FS : out std_logic_vector(4 downto 0);
          pc : inout std_logic_vector(31 downto 0)
         );
     end component;
     
    --Inputs
    signal reset : std_logic; 
    signal instruction : std_logic_vector(31 downto 0);     
    signal V, C, N, Z : std_logic;                                                                                                                                                                               
    signal Clk : std_logic := '1';
    
    --Outputs
    signal DR, SA, SB : std_logic_vector(4 downto 0);      
    signal TD, TA, TB : std_logic;  
    signal MB, MD, RW, MM, MW : std_logic;  
    signal FS : std_logic_vector(4 downto 0);  
    signal pc : std_logic_vector(31 downto 0);  
                                                                                                                                                                                                                               

begin
   --Instantiate the Unit Under Test (UUT)
   uut : control_unit_32bit_CLA PORT MAP
   (
        reset => reset,
        instruction => instruction,
        V => V,
        C => C,
        N => N,
        Z => Z,
        Clk => Clk,
        DR => DR,
        SA => SA,
        SB => SB,
        TD => TD,
        TA => TA,
        TB => TB,
        MB => MB,
        MD => MD,
        RW => RW,
        MM => MM,
        MW => MW,
        FS => FS,
        pc => pc
    );
    
   Clk <= not Clk after 100ns;
   stim_proc: process
   begin	
        --test resetting pc and CAR
        reset <= '1';
        wait for 200ns;
        
        --test outputs for instruction
        reset <= '0';
        --                   opcode       |  DR   |  SA   |  SB
        instruction <= "00000000000000111"&"00010"&"00000"&"00010";     --SR  R2, R0, R2      
        wait;
   end process;
end Behavioral;