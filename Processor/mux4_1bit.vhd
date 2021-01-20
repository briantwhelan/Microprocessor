----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 14.11.2020 16:27:18
-- Module Name: mux4_1bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux4_1bit is
 Port(
      in0, in1, in2, in3 : in std_logic;
      s : in std_logic_vector(1 downto 0);
      output : out std_logic
     );
end mux4_1bit;

architecture Behavioral of mux4_1bit is
begin
    output <= in0 after 5ns when s = "00" else
              in1 after 5ns when s = "01" else
              in2 after 5ns when s = "10" else
              in3 after 5ns when s = "11" else
              '0' after 5ns;
end Behavioral;