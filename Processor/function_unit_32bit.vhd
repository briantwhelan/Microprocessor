----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 14.11.2020 16:27:18
-- Module Name: function_unit_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity function_unit_32bit is
 Port(
      A, B : in std_logic_vector(31 downto 0);
      FS : in std_logic_vector(4 downto 0);
      V, C, N, Z : out std_logic;
      F : out std_logic_vector(31 downto 0)
      );
end function_unit_32bit;

architecture Behavioral of function_unit_32bit is
    --components
    component alu_32bit 
     Port(
          A, B : in std_logic_vector(31 downto 0);
          c_in : in std_logic;
          sel : in std_logic_vector(1 downto 0);
          mode : in std_logic;
          G : out std_logic_vector(31 downto 0);
          c_out, v : out std_logic
          );
    end component;
    
    component shifter_32bit 
     Port(
          B : in std_logic_vector(31 downto 0);
          s : in std_logic_vector(1 downto 0);
          IL, IR : in std_logic;
          H : out std_logic_vector(31 downto 0) 
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
    signal alu_output : std_logic_vector(31 downto 0);
    signal shifter_output : std_logic_vector(31 downto 0);
    
begin
    --port maps
    alu : alu_32bit PORT MAP
    (
        A => A,
        B => B,
        c_in => FS(0),
        sel => FS(2 downto 1),
        mode => FS(3),
        G => alu_output,
        c_out => C,
        v => V
     );
     
    shifter : shifter_32bit PORT MAP
    (
        B => B,
        s => FS(3 downto 2),
        IL => '0',
        IR => '0',
        H => shifter_output
     );
     
    mux : mux2_32bit PORT MAP
    (
        in0 => alu_output,
        in1 => shifter_output,
        s => FS(4),
        output => F
     );
    
    N <= '1' after 5ns when alu_output(31) = '1' else
         '0' after 5ns when alu_output(31) = '0' else
         '0' after 5ns;
         
    Z <= '1' after 5ns when alu_output = x"00000000" else
         '0' after 5ns;
end Behavioral;
