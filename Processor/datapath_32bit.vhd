----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 26.11.2020 22:09:33
-- Module Name: datapath_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath_32bit is
 Port(
        data_in : in std_logic_vector(31 downto 0);
        constant_in : in std_logic_vector(4 downto 0);
        control_word : in std_logic_vector(22 downto 0);
        TD, TA, TB : in std_logic;
        Clk : in std_logic;
        V, C, N, Z : out std_logic;
        address_out, data_out : out std_logic_vector(31 downto 0)
     );
end datapath_32bit;

architecture Behavioral of datapath_32bit is
   --components
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
        
    component function_unit_32bit 
     Port(
          A, B : in std_logic_vector(31 downto 0);
          FS : in std_logic_vector(4 downto 0);
          V, C, N, Z : out std_logic;
          F : out std_logic_vector(31 downto 0)
          );
    end component;
    
    component mux2_32bit
     Port(
          in0, in1 : in std_logic_vector(31 downto 0);
          s : in std_logic;
          output : out std_logic_vector(31 downto 0) 
          );
    end component;
    
    component zero_fill_32bit
     Port( 
          input : in std_logic_vector(4 downto 0);
          output : out std_logic_vector(31 downto 0)
          );
    end component;

    --signals
    signal regA : std_logic_vector(31 downto 0);
    signal regB : std_logic_vector(31 downto 0);
    signal constantExtended : std_logic_vector(31 downto 0);
    signal constantOrB : std_logic_vector(31 downto 0);
    signal function_unit_out : std_logic_vector(31 downto 0);
    signal bus_D : std_logic_vector(31 downto 0);

begin
    --port maps
    registerFile : register_file_32bit PORT MAP
    (
       data => bus_D,                                                                                                                                                                                                                                   
       write => control_word(0),                                                                                                                                                                                                                                                       
       address_A => control_word(17 downto 13),                                                                                                                                                                                                                                   
       address_B => control_word(12 downto 8),                                                                                                                                                                                                                                     
       address_des => control_word(22 downto 18), 
       TD => TD,
       TA => TA,
       TB => TB,                                                                                                                                                                                                                               
       Clk =>  Clk,                                                                                                                                                                                                                                                     
       output_A => regA,                                                                                                                                                                                                                                
       output_B => regB                                                                                                                                                                                                                                 
    );
    
   constantExtend : zero_fill_32bit PORT MAP
   (
        input => constant_in,
        output => constantExtended
    );
    
   muxB : mux2_32bit PORT MAP
   (
        in0 => regB,
        in1 => constantExtended,
        s => control_word(7),
        output => constantOrB
    );
    
   functionUnit : function_unit_32bit PORT MAP
   (
        A => regA,
        B => constantOrB,
        FS => control_word(6 downto 2),
        V => V,
        C => C,
        N => N,
        Z => Z,
        F => function_unit_out
    );
    
   muxD : mux2_32bit PORT MAP
   (
        in0 => function_unit_out,
        in1 => data_in,
        s => control_word(1),
        output => bus_D
    );
    
    address_out <= regA;
    data_out <= constantOrB;
end Behavioral;
