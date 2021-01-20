----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 23.10.2020 15:57:50
-- Design Name: 
-- Module Name: register_file_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file_32bit_tb is
end register_file_32bit_tb;

architecture Behavioral of register_file_32bit_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component register_file_32bit
     Port( 
          data : in std_logic_vector(31 downto 0);
          write : in std_logic;
          address_A, address_B, address_des : in std_logic_vector(4 downto 0);
          TD, TA, TB : in std_logic;
          Clk : in std_logic;
          output_A, output_B : out std_logic_vector(31 downto 0)                                                                                                                                                                                                                                
          );
    end component;
    
    --Inputs
    signal data : std_logic_vector(31 downto 0);                                                                                                                                                                                                                                    
    signal write : std_logic;                                                                                                                                                                                                                                                       
    signal address_A : std_logic_vector(4 downto 0);                                                                                                                                                                                                                                 
    signal address_B : std_logic_vector(4 downto 0);                                                                                                                                                                                                                                  
    signal address_des : std_logic_vector(4 downto 0);
    signal TD : std_logic;      
    signal TA : std_logic;
    signal TB : std_logic;                                                                                                                                                                                                                        
    signal Clk : std_logic := '1';
    
    --Outputs
    signal output_A : std_logic_vector(31 downto 0);                                                                                                                                                                                                                                 
    signal output_B : std_logic_vector(31 downto 0);   
    
begin
   --Instantiate the Unit Under Test (UUT)
   uut : register_file_32bit PORT MAP
   (
        data => data,
        write => write,
        address_A => address_A,
        address_B => address_B,
        address_des => address_des,
        TD => TD,
        TA => TA,
        TB => TB,
        Clk => Clk,
        output_A => output_A,
        output_B => output_B
    );
    
   Clk <= not Clk after 10ns;
   stim_proc: process
   begin	
         --test loading each register with value
         write <= '1';
         TD <= '0';
         TA <= '0';
         TB <= '0';
         address_des <= "00000";
         data <= x"19334414";
         wait for 20ns;
         
         address_des <= "00001";
         data <= x"19334413";
         wait for 20ns;
         
         address_des <= "00010";
         data <= x"19334412";
         wait for 20ns;
         
         address_des <= "00011";
         data <= x"19334411";
         wait for 20ns;
         
         address_des <= "00100";
         data <= x"19334410";
         wait for 20ns;
         
         address_des <= "00101";
         data <= x"1933440F";
         wait for 20ns;
         
         address_des <= "00110";
         data <= x"1933440E";
         wait for 20ns;
         
         address_des <= "00111";
         data <= x"1933440D";
         wait for 20ns;
         
         address_des <= "01000";
         data <= x"1933440C";
         wait for 20ns;
         
         address_des <= "01001";
         data <= x"1933440B";
         wait for 20ns;
         
         address_des <= "01010";
         data <= x"1933440A";
         wait for 20ns;
         
         address_des <= "01011";
         data <= x"19334409";
         wait for 20ns;
         
         address_des <= "01100";
         data <= x"19334408";
         wait for 20ns;
         
         address_des <= "01101";
         data <= x"19334407";
         wait for 20ns;
         
         address_des <= "01110";
         data <= x"19334406";
         wait for 20ns;
         
         address_des <= "01111";
         data <= x"19334405";
         wait for 20ns;
         
         address_des <= "10000";
         data <= x"19334404";
         wait for 20ns;
         
         address_des <= "10001";
         data <= x"19334403";
         wait for 20ns;
         
         address_des <= "10010";
         data <= x"19334402";
         wait for 20ns;
         
         address_des <= "10011";
         data <= x"19334401";
         wait for 20ns;
         
         address_des <= "10100";
         data <= x"19334400";
         wait for 20ns;
         
         address_des <= "10101";
         data <= x"193343FF";
         wait for 20ns;
         
         address_des <= "10110";
         data <= x"193343FE";
         wait for 20ns;
         
         address_des <= "10111";
         data <= x"193343FD";
         wait for 20ns;
         
         address_des <= "11000";
         data <= x"193343FC";
         wait for 20ns;
         
         address_des <= "11001";
         data <= x"193343FB";
         wait for 20ns;
         
         address_des <= "11010";
         data <= x"193343FA";
         wait for 20ns;
         
         address_des <= "11011";
         data <= x"193343F9";
         wait for 20ns;
         
         address_des <= "11100";
         data <= x"193343F8";
         wait for 20ns;
         
         address_des <= "11101";
         data <= x"193343F7";
         wait for 20ns;
         
         address_des <= "11110";
         data <= x"193343F6";
         wait for 20ns;
         
         address_des <= "11111";
         data <= x"193343F5";
         wait for 20ns;
         
         
         -- test writing to reg 32
         TD <= '1';
         TA <= '1';
         TB <= '1';
         data <= x"AAAAAAAA";
         wait for 20ns;
         
         -- test data coming out of A and B
         write <= '0';
         TD <= '1';
         TA <= '1';
         TB <= '1';
         address_A <= "00000"; --reg32
         address_B <= "00000"; --reg32
         wait for 20ns;
         
         TD <= '0';
         TA <= '0';
         TB <= '0';
         address_A <= "00001"; --reg1
         address_B <= "00010"; --reg2
         wait for 20ns;
         
         address_A <= "00000"; --reg0
         address_B <= "11111"; --reg31
         wait for 20ns;
        
         address_A <= "00001"; --reg1
         address_B <= "11110"; --reg30
         wait for 20ns;
        
         address_A <= "00010"; --reg2
         address_B <= "11101"; --reg29
         wait for 20ns;
        
         address_A <= "10010"; --reg18
         address_B <= "01100"; --reg12
         wait for 20ns;
         
         -- test writing data to reg when write isn't enabled(shouldn't write)
         write <= '0';
         TD <= '0';
         TA <= '0';
         TB <= '0';
         address_des <= "00000";
         data <= x"FFFFFFFF";
         wait for 20ns;
         
         address_des <= "00001";
         data <= x"EEEEEEEE";
         wait; 
   end process;
end Behavioral;