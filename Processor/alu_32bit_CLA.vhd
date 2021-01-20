----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 02.01.2021 23:49:58
-- Module Name: alu_32bit_CLA - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu_32bit_CLA is
 Port(
      A, B : in std_logic_vector(31 downto 0);
      c_in : in std_logic;
      sel : in std_logic_vector(1 downto 0);
      mode : in std_logic;
      G : out std_logic_vector(31 downto 0);
      c_out, v : out std_logic
      );
end alu_32bit_CLA;

architecture Behavioral of alu_32bit_CLA is
    --components
    component arithmetic_circuit_32bit_CLA 
     Port(
          A, B : in std_logic_vector(31 downto 0);
          c_in : in std_logic;
          sel : in std_logic_vector(1 downto 0);
          G : out std_logic_vector(31 downto 0);
          c_out, v : out std_logic
          );
    end component;
    
    component logic_circuit_32bit 
     Port(
          A, B : in std_logic_vector(31 downto 0);
          sel : in std_logic_vector(1 downto 0);
          G : out std_logic_vector(31 downto 0)
          );
    end component;
    
    component mux2_32bit 
     Port(
          in0, in1 : in std_logic_vector(31 downto 0);
          s : in std_logic;
          output : out std_logic_vector(31 downto 0)
          );
    end component;
        
    --signals
    signal arith_output : std_logic_vector(31 downto 0);
    signal logic_output : std_logic_vector(31 downto 0);
    
begin    
    --port maps
    arithCircuit : arithmetic_circuit_32bit_CLA PORT MAP
    (
        A => A,
        B => B,
        c_in => c_in,
        sel => sel,
        G => arith_output,
        c_out => c_out,
        v => v
    );
    
    logicCircuit : logic_circuit_32bit PORT MAP
    (
        A => A,
        B => B,
        sel => sel,
        G => logic_output
    );
    
    mux2to32 : mux2_32bit PORT MAP
    (
        in0 => arith_output,
        in1 => logic_output,
        s => mode,
        output => G
    );
end Behavioral;
