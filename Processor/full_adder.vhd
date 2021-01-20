----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 02.11.2020 15:39:46
-- Module Name: full_adder - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder is
 Port(
      in0, in1 : in std_logic;
      c_in : in std_logic;
      sum, c_out : out std_logic
      );
end full_adder;

architecture Behavioral of full_adder is
signal s1, s2, s3 : std_logic;
begin
    s1 <= (in0 xor in1) after 5ns;
    s2 <= (s1 and c_in) after 5ns;
    s3 <= (in0 and in1) after 5ns;
    sum <= (s1 xor c_in) after 5ns;
    c_out <= (s2 or s3) after 5ns;
end Behavioral;
