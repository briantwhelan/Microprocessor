----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 14:45:23
-- Module Name: flag_register_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flag_register_tb is
end flag_register_tb;

architecture Behavioral of flag_register_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component flag_register
     Port( 
          Z, N, C, V : in std_logic;
          FL, RZ, RN, RC, RV : in std_logic;
          Clk : in std_logic;
          flags : inout std_logic_vector(3 downto 0)
          );
    end component;
    
    --Inputs
    signal Z : std_logic;      
    signal N : std_logic;
    signal C : std_logic;    
    signal V : std_logic;      
    signal FL : std_logic;
    signal RZ : std_logic; 
    signal RN : std_logic;      
    signal RC : std_logic;
    signal RV : std_logic;                                                                                                                                                                                                                     
    signal Clk : std_logic := '1';
    
    --Outputs
    signal flags : std_logic_vector(3 downto 0);                                                                                                                                                                                                                                 

begin
   --Instantiate the Unit Under Test (UUT)
   uut : flag_register PORT MAP
   (
        Z => Z,     
        N => N,
        C => C,    
        V => V,       
        FL => FL, 
        RZ => RZ,  
        RN => RN,      
        RC => RC,
        RV => RV,                                                                                                                                                                                                                     
        Clk => Clk,
        flags => flags
    );
    
   Clk <= not Clk after 10ns;
   stim_proc: process
   begin	
        --test resetting condition code flags
        RZ <= '1';
        RN <= '1';
        RC <= '1';
        RV <= '1';
        wait for 20ns;
        
        --test loading condition code flags with values(FL is 0)- doesn't load
        RZ <= '0';
        RN <= '0';
        RC <= '0';
        RV <= '0';
        Z <= '1';
        N <= '1';
        C <= '1';
        V <= '1';
        wait for 20ns;
        
        --test loading condition code flags with values(FL is 1)- loads
        FL <= '1';
        wait;
   end process;
end Behavioral;