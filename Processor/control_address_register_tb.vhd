----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 15.12.2020 19:47:11
-- Module Name: control_address_register_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_address_register_tb is
end control_address_register_tb;

architecture Behavioral of control_address_register_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component control_address_register
     Port( 
          reset : in std_logic;
          input : in std_logic_vector(16 downto 0);
          load : in std_logic;
          Clk : in std_logic;
          address : inout std_logic_vector(16 downto 0) 
          );
    end component;
    
    --Inputs    
    signal reset : std_logic;
    signal input : std_logic_vector(16 downto 0);
    signal load : std_logic;                                                                                                                                                                                                                   
    signal Clk : std_logic := '1';
    
    --Outputs
    signal address : std_logic_vector(16 downto 0);

begin
   --Instantiate the Unit Under Test (UUT)
   uut : control_address_register PORT MAP
   (
        reset => reset,
        input => input,
        load => load,
        Clk => Clk,
        address => address
    );
    
   Clk <= not Clk after 10ns;
   stim_proc: process
   begin
        --test resetting CAR
        reset <= '1';
        wait for 20ns;
        
        --test loading CAR with value 
        reset <= '0';	
        load <= '1';
        input <= "00000000001111000";
        wait for 20ns;
        
        --test loading CAR with value when load is 0(shouldn't load)
        --and view CAR incrementing in each clock cycle
        load <= '0';
        input <= "11111111111111000";
        wait for 60ns;
        
        --reset CAR
        reset <= '1';
        wait;
   end process;
end Behavioral;