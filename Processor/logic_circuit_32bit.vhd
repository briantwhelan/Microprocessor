----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 11.11.2020 10:33:15
-- Module Name: logic_circuit_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_circuit_32bit is
 Port(
      A, B : in std_logic_vector(31 downto 0);
      sel : in std_logic_vector(1 downto 0);
      G : out std_logic_vector(31 downto 0)
      );
end logic_circuit_32bit;

architecture Behavioral of logic_circuit_32bit is
    --components
    component mux4_32bit 
     Port(
          in0, in1, in2, in3 : in std_logic_vector(31 downto 0);
          s : in std_logic_vector(1 downto 0);
          output : out std_logic_vector(31 downto 0)
          );
    end component;
    
    --signals
    signal in0 : std_logic_vector(31 downto 0); 
    signal in1 : std_logic_vector(31 downto 0); 
    signal in2 : std_logic_vector(31 downto 0); 
    signal in3 : std_logic_vector(31 downto 0); 
    
begin
    in0 <= A AND B after 5ns;
    in1 <= A OR B after 5ns;
    in2 <= A XOR B after 5ns;
    in3 <= NOT A after 5ns;
    
    --port maps
    mux4to32 : mux4_32bit PORT MAP
    (
        in0 => in0,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        s => sel,
        output => G
    );
end Behavioral;
